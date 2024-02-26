describe("Clippy", function ()
	it("can be required", function ()
		require('clippy.ui'):new()
	end)

	it("create new window", function ()
		require('clippy.ui'):new()
	end)

	it("close window/delete buffer", function ()
		require('clippy.ui'):close()
	end)

	it("toggle window", function ()
		require('clippy.ui'):toggle_menu()
	end)

	it("create Yank autocommand", function ()
		require('clippy.autocmd'):yank()
	end)
end)
