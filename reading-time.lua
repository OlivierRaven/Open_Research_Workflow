-- Estimates reading time from prose word count and inserts it as the
-- first block of the page body. Code blocks/tables are skipped since
-- they aren't read at prose pace.

local wpm = 200

local function count_words(blocks)
  local count = 0

  local function count_inlines(inlines)
    for _, inline in ipairs(inlines) do
      if inline.t == "Str" then
        count = count + 1
      elseif inline.content then
        count_inlines(inline.content)
      end
    end
  end

  local function walk(blks)
    for _, block in ipairs(blks) do
      if block.t == "Para" or block.t == "Plain" or block.t == "Header" then
        count_inlines(block.content)
      elseif block.t == "BulletList" or block.t == "OrderedList" then
        for _, item in ipairs(block.content) do
          walk(item)
        end
      elseif block.t == "BlockQuote" or block.t == "Div" then
        walk(block.content)
      end
      -- CodeBlock, Table, RawBlock etc. intentionally skipped
    end
  end

  walk(blocks)
  return count
end

function Pandoc(doc)
  if not quarto.doc.is_format("html") then
    return doc
  end

  local words = count_words(doc.blocks)
  local minutes = math.max(1, math.ceil(words / wpm))
  local label = minutes .. " min read"

  local marker = pandoc.Div(
    { pandoc.Para({ pandoc.Str(label) }) },
    pandoc.Attr("", { "reading-time" })
  )

  table.insert(doc.blocks, 1, marker)
  return doc
end
