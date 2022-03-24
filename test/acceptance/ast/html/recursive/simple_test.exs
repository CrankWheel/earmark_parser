defmodule Test.Acceptance.Ast.Html.Recursive.SimpleTest do
  use Support.AcceptanceTestCase

  describe "some simple tags" do
    test "status quo (1.4.x)" do
      markdown = """
      <div class="divy">
        <span>
          content
        </span>
      </div>
      """

      ast = [
        vtag("div", "  <span>\n    content\n  </span>", class: "divy")
      ]
      assert ast_from_md(markdown) == ast
    end

    test "wanted in 1.5" do
      markdown = """
      <div class="divy">
        <span>
          content
        </span>
      </div>
      """

      inner = [
        vtag("span", "    content")
      ]
      ast = [
        vtag("div", inner, class: "divy")
      ]
      assert ast_from_md(markdown) == ast
    end
  end


end
# SPDX-License-Identifier: Apache-2.0
