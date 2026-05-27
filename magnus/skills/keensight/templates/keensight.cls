% magnus/skills/keensight/templates/keensight.cls
% 锋识 keensight —— 单一知识脉络的自包含小书。ctexbook + XeLaTeX。
% 编译：latexmk -xelatex main.tex （或 xelatex main.tex 两遍）
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{keensight}[2026/05/27 keensight primer]

\PassOptionsToClass{\CurrentOption}{ctexbook}
\LoadClass[zihao=-4, a4paper, UTF8, fontset=fandol]{ctexbook}

\RequirePackage{geometry}
\geometry{margin=2.6cm}

\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage[most]{tcolorbox}
\RequirePackage{enumitem}
\RequirePackage{microtype}
\RequirePackage{hyperref}
\hypersetup{
  colorlinks = true,
  linkcolor  = BrickRed,
  citecolor  = ForestGreen,
  urlcolor   = NavyBlue,
  bookmarksnumbered = true,
}
\RequirePackage{cleveref}

% ---- 定理类环境：env 名走 ASCII（稳），显示名走中文 ----
\theoremstyle{definition}
\newtheorem{definition}{定义}[chapter]
\newtheorem{convention}[definition]{约定}
\newtheorem{example}[definition]{例}
\theoremstyle{plain}
\newtheorem{theorem}[definition]{定理}
\newtheorem{lemma}[definition]{引理}
\newtheorem{proposition}[definition]{命题}
\newtheorem{corollary}[definition]{推论}
\theoremstyle{remark}
\newtheorem*{remark}{注}
\renewcommand{\proofname}{证明}

% 定理族共享 definition 计数器且按章重置：不固定锚名时 hyperref 取裸计数器值，
% 同类环境在不同章会撞名（如各章都有 definition.1）→ PDF 书签 / 反向链接跳错目标。
% 故 7 个 \theH* 一律含章号、保全局唯一（已实测：删本块则锚名退化为裸值）。
\renewcommand{\theHdefinition}{\thechapter.\arabic{definition}}
\renewcommand{\theHconvention}{\thechapter.\arabic{definition}}
\renewcommand{\theHexample}{\thechapter.\arabic{definition}}
\renewcommand{\theHtheorem}{\thechapter.\arabic{definition}}
\renewcommand{\theHlemma}{\thechapter.\arabic{definition}}
\renewcommand{\theHproposition}{\thechapter.\arabic{definition}}
\renewcommand{\theHcorollary}{\thechapter.\arabic{definition}}

\crefname{definition}{定义}{定义}
\crefname{theorem}{定理}{定理}
\crefname{lemma}{引理}{引理}
\crefname{proposition}{命题}{命题}
\crefname{corollary}{推论}{推论}
\crefname{chapter}{第}{第}
\creflabelformat{chapter}{#2#1#3 章}

% ---- 双轨：规格（顶层 spec，读者只读这一轨即可指挥 AI）/ 推演（底层 technical，起疑时下潜）----
\newtcolorbox{spec}{
  enhanced, breakable,
  colback = NavyBlue!5, colframe = NavyBlue!60!black, boxrule = 0.5pt,
  fonttitle = \bfseries, coltitle = white, title = 规格,
  left = 2mm, right = 2mm, top = 1mm, bottom = 1mm,
}
\newtcolorbox{deriv}{
  enhanced, breakable,
  colback = white, colframe = black!18, boxrule = 0.4pt,
  fonttitle = \bfseries\small, coltitle = black!55, title = 推演,
  left = 2mm, right = 2mm, top = 1mm, bottom = 1mm,
}

% ---- 承重节点高亮：标出主干上最吃重的一步 ----
% keystep/soul 常嵌入同为 breakable 的 spec/deriv 内：enhanced 启用高级皮肤、
% breakable 允许随外层一起跨页断行，使较长的嵌套框不溢出。
\newtcolorbox{keystep}[1][]{
  enhanced, breakable,
  colback = NavyBlue!6, colframe = NavyBlue!55!black, boxrule = 0.7pt, arc = 2pt,
  fonttitle = \bfseries, coltitle = white, title = {链条节点#1},
  left = 2mm, right = 2mm, top = 1.2mm, bottom = 1.2mm,
}
\newtcolorbox{soul}[1][]{
  enhanced, breakable,
  colback = BurntOrange!8, colframe = BurntOrange!80!black, boxrule = 0.9pt, arc = 2pt,
  fonttitle = \bfseries, coltitle = black!70, title = {灵魂一步#1},
  left = 2mm, right = 2mm, top = 1.2mm, bottom = 1.2mm,
}

% ---- 扉页：校徽 + 中英标题 + 署名「北京大学物理学院 · Rise-AGI」+ 版次/日期 ----
\newcommand{\@zhtitle}{}
\newcommand{\@entitle}{}
\newcommand{\@edition}{}
\newcommand{\@datemark}{}
\newcommand{\zhtitle}[1]{\renewcommand{\@zhtitle}{#1}}
\newcommand{\entitle}[1]{\renewcommand{\@entitle}{#1}}
\newcommand{\edition}[1]{\renewcommand{\@edition}{#1}}
\newcommand{\datemark}[1]{\renewcommand{\@datemark}{#1}}

\newcommand{\makecover}{%
  \begin{titlepage}
    \centering
    \vspace*{2.4cm}
    \includegraphics[width=3.2cm]{assets/pkulogo.pdf}\\[1.1cm]
    {\zihao{1}\bfseries \@zhtitle \par}\vspace{0.7cm}
    {\zihao{4}\itshape \@entitle \par}\vspace{2.4cm}
    {\zihao{3} 北京大学物理学院 \enspace·\enspace Rise-AGI \par}
    \vfill
    {\zihao{5} \@edition\\[0.3em] \@datemark \par}
    \vspace{1.4cm}
  \end{titlepage}
}
