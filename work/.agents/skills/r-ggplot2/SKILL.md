---
name: r-ggplot2
description: 用 ggplot2 绘制符合统一规范的图表。
---

# 统一规范的科研绘图

本 skill 把绘图约定固化下来。只要说"画出 x 和 y 的散点图", 就应产出一张**风格统一、标签完整**的图。

## 工作流程

1. **确认变量**:识别要画的变量及其类型(连续 / 分类),据此选择合适的几何对象。
2. **套用规范**:按下面的约定设置主题、配色、标签。
3. **给出可运行代码**:给出完整可运行代码。
4. **一句话说明**:简述为什么这样画(选了什么图、为何这样配色/加趋势线)。

## 核心约定

### 统一主题
```r
library(ggplot2)
theme_set(
  theme_minimal(base_size = 13) +
    theme(
      plot.title    = element_text(face = "bold"),
      panel.grid.minor = element_blank(),
      legend.position  = "right"
    )
)
```

### 配色

- 分类变量:使用色盲友好的 Okabe–Ito 调色板。
  ```r
  pal_oi <- c("#0072B2", "#E69F00", "#009E73", "#D55E00",
              "#CC79A7", "#56B4E9", "#F0E442", "#999999")
  # 用 scale_color_manual(values = pal_oi) 或 scale_fill_manual(values = pal_oi)
  ```
- 连续变量:使用 `scale_color_viridis_c()` / `scale_fill_viridis_c()`。

### 标签
- 一律用 `labs()` 补上 `title`、`x`、`y`,分组时补 `color` / `fill` 图例标题。
- 轴标签写清含义与单位(如"周自学时长(小时)")。


### 散点图默认
```r
ggplot(dat, aes(x, y, color = grp)) +
  geom_point(alpha = 0.7, size = 2.2) +
  geom_smooth(method = "lm", se = TRUE, linewidth = 0.8) +  # 展示趋势;不需要时可去掉
  scale_color_manual(values = pal_oi) +
  labs(title = "……", x = "……", y = "……", color = "……")
```
- 点很多、重叠严重时,改用 `geom_jitter()` 或调低 `alpha`。
- 只有一组、无需分组时,去掉 `color=` 与配色标度。


