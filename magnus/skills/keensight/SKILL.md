---
name: keensight
description: 当用户想真正吃透一条知识脉络——推导一套理论、吃透一段代码/系统、从自己当下的基础抵达某个数学/物理/计算课题的前沿——时触发。产出一份「锋识」：深度优先、教学级严谨（绝不科普）、自包含、署名的中文 PDF，按 AI 时代的需要分层（顶层是可用于指挥 AI 的 spec，底层暴露完整 technical 细节），把用户从真实起点逐原语带到前沿。
---

# 锋识 (keensight)

为用户产出一份**锋识**：一条深度优先、从其真实基础直抵学科前沿（数学 / 物理 / 计算皆可——推导一套理论、吃透一段代码 / 系统都算）的自包含中文小书，交付为署名的高可读 PDF。

## 目标

用户要的是**正确的知识以便指挥 AI**，不是全自动。据此定调：

- **教学性与严谨性恒定，篇幅自由**——起点离前沿越远写得越长，但每一步都严谨，绝不科普式一带而过。
- **分层服务**——顶层是可直接拿去指挥 AI 的 spec，底层完整暴露 technical 细节供起疑时下潜。
- **正确性优先于自动化**——缺料、缺书就向用户提需（OCR 推荐 minerU），别硬编。

## 流程

1. **定标**——从触发语 + 追问锁定「前沿终点」与用户真实目标。
2. **摸底**——用客户端原生问卷探背景，钉下有向图的根（起点）。→ [`references/probe.md`](references/probe.md)
3. **铺脉**——建从起点到前沿的依赖**有向图**：先定原语、只留主干；用 sub-agent 调研宽度、核查来源。→ [`references/authoring.md`](references/authoring.md)
4. **撰写**——拓扑序逐节成文，每节点「规格 / 推演」双轨；干净中文、形式化优先、熵减。→ [`references/authoring.md`](references/authoring.md) + [`templates/`](templates/)
5. **打磨交付**——过 3 并行 / 连续 2 轮全绿的 sub-agent 评审闸，输出高可读 PDF。→ [`references/review-loop.md`](references/review-loop.md)

## 不可让渡的原则

- **深度优先 + 知三陈一**——只走最主干脉络；自己须掌握三倍的宽度，只呈现一倍，宽度隐而不说。对它的批评、对其简化假设之局限的讨论、对可观测原语的批判，忽略或一笔带过。
- **不凭印象**——一切陈述调工具核查、再三阅读；善用 parallel / loop sub-agent 调研并蒸馏，把宽度留在 sub-agent，别灌进主 context。
- **马尔科夫性**——熵减、干净。改了主意只留 Y，像 X 从未出现，不写「本来 X 其实 Y」。
- **公开可接受**——完备自包含；扉页校徽 + 「北京大学物理学院 · Rise-AGI」署名。本 skill 自身亦须公开可接受。
- **语言**——流利干净中文，禁中英混杂；著名术语 / 结论 / 定理 / 现象直接用英文。假定用户英文不错（不必就此问卷）。

## 资产

- [`templates/`](templates/)——LaTeX 模板（`keensight.cls` + `main.tex` 骨架 + 校徽）。`latexmk -xelatex main.tex` 编译，产物即署名 PDF。
- `references/`——分册：[`probe.md`](references/probe.md)（摸底问卷）、[`authoring.md`](references/authoring.md)（铺脉与撰写）、[`review-loop.md`](references/review-loop.md)（交付评审闸）。
