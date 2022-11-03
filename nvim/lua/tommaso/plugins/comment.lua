local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

comment.setup()

local ft = require("Comment.ft")
ft.set("eruby", "<!--%s-->")
