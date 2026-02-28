-- LaTeX snippets

local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end 

local M = {

  -- preamble
  s({trig="preamble"},
    fmta(
      [[
      \documentclass[11pt]{article}

      \usepackage[margin=1.2in]{geometry}
      \usepackage{amsmath}
      \usepackage{amssymb}

      \setlength\parindent{0 pt}
      \renewcommand*{\arraystretch}{1.3}

      \newenvironment{amatrix}[1]{%
        \left(\begin{array}{@{}*{#1}{c}|c@{}}
      }{%
        \end{array}\right)
      }

      \title{<>}
      \author{Sanjay P Mallar \\ SR No. 23731}
      \date{\today}

      \begin{document}

      \maketitle

      <>

      \end{document}
      ]],
      { i(1), i(0) }
    )
  ),

  -- formatting
  s({trig="tit", snippetType="autosnippet"},
    fmta(
      "\\textit{<>}",
      { i(1) }
    )
  ),
  s({trig="tbf", snippetType="autosnippet"},
    fmta(
      "\\textbf{<>}",
      { i(1) }
    )
  ),
  s({trig="temf", snippetType="autosnippet"},
    fmta(
      "\\emph{<>}",
      { i(1) }
    )
  ),

  -- environments
  s({trig="eq", dscr="A LaTeX equation environment"},
    fmta(
      [[
        \begin{equation}
          <>
        \end{equation}
      ]],
      { i(1) }
    )
  ),

  s({trig="im", wordTrig=false},
    fmta(
      "$<>$",
      { i(1) }
    )
  ),

  s({trig="dm"},
    fmta(
      [[
        \[
          <>
        \]
      ]],
      { i(1) }
    )
  ),
  s ({trig="env", snippetType="autosnippet"},
    fmta(
      [[
        \begin{<>}
          <>
        \end{<>}
      ]],
      { i(1), i(2), rep(1) }
    )
  ),



  -- Math

  -- greek
  s({trig=";a", snippetType="autosnippet", condition=math},
    {
      t("\\alpha")
    }
  ),
  s({trig=";b", snippetType="autosnippet", condition=math},
    {
      t("\\beta")
    }
  ),
  s({trig=";g", snippetType="autosnippet", condition=math},
    {
      t("\\gamma")
    }
  ),
  s({trig=";d", snippetType="autosnippet", condition=math},
    {
      t("\\delta")
    }
  ),
  s({trig=";e", snippetType="autosnippet", condition=math},
    {
      t("\\epsilon")
    }
  ),


  -- mathbb
  s({trig="NN", snippetType="autosnippet", condition=math},
    {
      t("\\mathbb{N}")
    }
  ),
  s({trig="FF", snippetType="autosnippet", condition=math},
    {
      t("\\mathbb{F}")
    }
  ),
  s({trig="KK", snippetType="autosnippet", condition=math},
    {
      t("\\mathbb{K}")
    }
  ),
  s({trig="LL", snippetType="autosnippet", condition=math},
    {
      t("\\mathbb{L}")
    }
  ),
  s({trig="ZZ", snippetType="autosnippet", condition=math},
    {
      t("\\mathbb{Z}")
    }
  ),
  s({trig="QQ", snippetType="autosnippet", condition=math},
    {
      t("\\mathbb{Q}")
    }
  ),
  s({trig="RR", snippetType="autosnippet", condition=math},
    {
      t("\\mathbb{R}")
    }
  ),
  s({trig="CC", snippetType="autosnippet", condition=math},
    {
      t("\\mathbb{C}")
    }
  ),

  -- formatting
  s({trig="mbf", snippetType="autosnippet", wordTrig=false, condition=math},
    fmta(
      "\\mbf{<>}",
      { i(1) }
    )
  ),

  -- fractions
  s({trig="ff", snippetType="autosnippet", wordTrig=false, condition=math},
    fmta(
      "\\frac{<>}{<>}",
      { i(1), i(2) }
    )
  ),

  -- sup and sub
  s({trig="pw", snippetType="autosnippet", wordTrig=false, condition=math},
    fmta(
      "^{<>}",
      { i(1) }
    )
  ),
  s({trig="sb", snippetType="autosnippet", wordTrig=false, condition=math},
    fmta(
      "_{<>}",
      { i(1) }
    )
  ),

}

return M
