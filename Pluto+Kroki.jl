### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ bbb566cd-8176-4c5b-a6e9-460045c47c0a
using Kroki, PlutoUI

# ╔═╡ 1cc9a4dc-adec-47f1-9862-66ba2510b546
using JSON

# ╔═╡ eca0e01d-fad4-494f-9f09-700bfb6ea89f
md"# Kroki + Pluto = ❤"

# ╔═╡ 6b0df1fb-5471-4eb5-8cbb-e3f8bfdfe8b9
PlutoUI.TableOfContents()

# ╔═╡ f124a2a2-5276-4550-aba7-bdbf3e756c96
 md"""
## Kroki

[Kroki Documentation](https://kroki.io/)

[Kroki Examples](https://kroki.io/examples.html)

Diagram Type Macro Strings:
 - @actdiag_str
 - @blockdiag_str
 - @c4plantuml_str
 - @ditaa_str
 - @erd_str
 - @graphviz_str
 - @mermaid_str
 - @nomnoml_str
 - @nwdiag_str
 - @packetdiag_str
 - @plantuml_str
 - @rackdiag_str
 - @seqdiag_str
 - @svgbob_str
 - @umlet_str
 - @vega_str
 - @vegalite_str
 - @wavedrom_str
"""

# ╔═╡ 9d58e82c-84d3-4c60-995f-7791156da2b0
html"""
<div class="admonition note"><p class="admonition-title">⚠️ Warning ⚠️</p>
<p>Kroki.jl sends your data to servers hoted on Exoscale to create each diagram. If you would like your diagrams to remain private, you may install a self-managaged instance of Kroki using <a href="https://docs.kroki.io/kroki/setup/install">these instructions</a>.</p>
</div>
"""

# ╔═╡ c4630307-cc1c-44ad-854e-816e6afaa5e6
md"""
## BlockDiag

[BlockDaig Documentation](http://blockdiag.com/en/)

"""

# ╔═╡ b84c4f05-b966-4cfc-841d-94731ceb4337
md"""
Main Block Color: $(@bind c1 Select(["pink", "orange", "lightblue"]))

Other Block Color: $(@bind c2 ColorStringPicker(default="#aabbcc"))

Shape $(@bind shape Select([
	"box", "square", "roundedbox", "dots", "circle", "ellipse", "diamond", "minidiamond", "note", "mail", "cloud", "actor"
]))
"""

# ╔═╡ e4ce8fe6-ab10-4785-99e6-3af2a3a54fac
s = """blockdiag {
  Kroki -> generates -> "Block diagrams";
  Kroki -> is -> "very easy!";

  Kroki [shape = $shape, color = "$c1"];
  generates [ color = "$c2"]
  "Block diagrams" [color = "$c2"];
  is [ color = "$c2"]
  "very easy!" [color = "$c2"];
}"""

# ╔═╡ 068eed4a-cd89-4ed9-aff2-6ac549179992
Kroki.Diagram(:blockdiag , s)

# ╔═╡ 20d45bda-f252-439c-9343-7d05ae15f76f
md"""
## Plant UML

[PlantUML Documentation](https://plantuml.com/)
"""

# ╔═╡ 1ceac8df-7f90-429d-bc4b-0a35c190493a
Kroki.Diagram(:PlantUML, "Kroki -> Julia: Hello Julia!")

# ╔═╡ ac07b3e1-ce18-4870-984c-aabefda6f430
plantuml"""@startwbs
skinparam monochrome true
* Business Process \nModelling WBS
** Launch the project
*** Complete Stakeholder Research
*** Initial Implementation Plan
** Design phase
*** Model of AsIs Processes Completed
**** Model of AsIs Processes Completed1
**** Model of AsIs Processes Completed2
*** Measure AsIs performance metrics
*** Identify Quick Wins
** Complete innovate phase
@endwbs
"""

# ╔═╡ 7aed8ffa-64f3-4b5e-a153-c58a2c2c5f10
plantuml"""@startmindmap
skinparam monochrome true
+ OS
++ Ubuntu
+++ Linux Mint
+++ Kubuntu
+++ Lubuntu
+++ KDE Neon
++ LMDE
++ SolydXK
++ SteamOS
++ Raspbian
-- Windows 95
-- Windows 98
-- Windows NT
--- Windows 8
--- Windows 10
@endmindmap
"""

# ╔═╡ e6d95e94-5add-484a-831a-1828e40e213c
md"""
## GraphViz

[GraphViz Documentation](https://graphviz.org/documentation/)

"""

# ╔═╡ ec241a76-580d-480c-9a96-296845d61663
graphviz"""
digraph "unix" {
  graph [ fontname = "Helvetica-Oblique",
          fontsize = 36,
          label = "\nObject Oriented Graphs\nStephen North, 3/19/93",
          size = "6,6" ];
  node [ shape = polygon,
         sides = 4,
         distortion = "0.0",
         orientation = "0.0",
         skew = "0.0",
         color = white,
         style = filled,
         fontname = "Helvetica-Outline" ];
  "5th\nEdition" [sides=4, color=salmon2];
  "6th Edition" [sides=8, color=deepskyblue];
  "PWB 1.0" [sides=8, color=goldenrod2];
  "5th\nEdition" -> "6th Edition";
  "5th\nEdition" -> "PWB 1.0";
}
"""

# ╔═╡ f014806d-92f9-43e0-aa2f-0a1c7fd9964b
md"""
## Mermaid Diagrams

[Mermaid Documentation](https://mermaid-js.github.io/mermaid/#/)
"""

# ╔═╡ 70510d7e-37ab-424d-bdfa-b04ccbd23284
mermaid"""
gantt
    title A Gantt Diagram
    dateFormat  YYYY-MM-DD
    section Section
    A task           :a1, 2014-01-01, 30d
    Another task     :after a1, 20d
    section Another
    Task in sec      :2014-01-12, 12d
    another task     :24d
"""

# ╔═╡ 063692b9-b0a7-4664-b1dc-bfae4a662f46
mermaid"""
journey
    title My working day
    section Go to work
      Make tea: 5: Me
      Go upstairs: 3: Me
      Do work: 1: Me, Cat
    section Go home
      Go downstairs: 5: Me
      Sit down: 5: Me
"""

# ╔═╡ 8409dcec-506b-49bc-935f-a9ef8e1c8792
mermaid"""
pie title Pets adopted by volunteers
    "Dogs" : 386
    "Cats" : 85
    "Rats" : 15
"""

# ╔═╡ 9d84dd97-3e51-4944-bcc9-be4d6c4fb71e
mermaid"""
graph TD
    B["fa:fa-twitter for peace"]
    B-->C[fa:fa-ban forbidden]
    B-->D(fa:fa-spinner);
    B-->E(A fa:fa-camera-retro perhaps?);

"""

# ╔═╡ 0212006d-8fed-4df5-945e-a51c165be41d
mermaid"""
graph LR
    c1-->a2
    subgraph one
    a1-->a2
    end
    subgraph two
    b1-->b2
    end
    subgraph three
    c1-->c2
    end
"""

# ╔═╡ 796dc404-3e98-4b57-893f-57e42eb7d304
md"""
## WaveDrom

[WaveDrom Tutorial](https://wavedrom.com/tutorial.html)
"""

# ╔═╡ a6fded94-f27f-4fe9-a3d7-7367cfcd8c1b
wavedrom"""
{ signal: [
  { name: "clk",         wave: "p.....|..." },
  { name: "Data",        wave: "x.345x|=.x", data: ["head", "body", "tail", "data"] },
  { name: "Request",     wave: "0.1..0|1.0" },
  {},
  { name: "Acknowledge", wave: "1.....|01." }
]}
"""

# ╔═╡ c0ec9039-817b-4a9b-96d0-b6f8b6dbb719
md"## Vega and Vega Lite"

# ╔═╡ 43eb53b5-09f1-4969-8b2c-81d2a7cb738c
vega"""
{
  "$schema": "https://vega.github.io/schema/vega/v5.json",
  "description": "A radar chart example, showing multiple dimensions in a radial layout.",
  "width": 400,
  "height": 400,
  "padding": 40,
  "autosize": {"type": "none", "contains": "padding"},

  "signals": [
    {"name": "radius", "update": "width / 2"}
  ],

  "data": [
    {
      "name": "table",
      "values": [
        {"key": "key-0", "value": 19, "category": 0},
        {"key": "key-1", "value": 22, "category": 0},
        {"key": "key-2", "value": 14, "category": 0},
        {"key": "key-3", "value": 38, "category": 0},
        {"key": "key-4", "value": 23, "category": 0},
        {"key": "key-5", "value": 5, "category": 0},
        {"key": "key-6", "value": 27, "category": 0},
        {"key": "key-0", "value": 13, "category": 1},
        {"key": "key-1", "value": 12, "category": 1},
        {"key": "key-2", "value": 42, "category": 1},
        {"key": "key-3", "value": 13, "category": 1},
        {"key": "key-4", "value": 6, "category": 1},
        {"key": "key-5", "value": 15, "category": 1},
        {"key": "key-6", "value": 8, "category": 1}
      ]
    },
    {
      "name": "keys",
      "source": "table",
      "transform": [
        {
          "type": "aggregate",
          "groupby": ["key"]
        }
      ]
    }
  ],

  "scales": [
    {
      "name": "angular",
      "type": "point",
      "range": {"signal": "[-PI, PI]"},
      "padding": 0.5,
      "domain": {"data": "table", "field": "key"}
    },
    {
      "name": "radial",
      "type": "linear",
      "range": {"signal": "[0, radius]"},
      "zero": true,
      "nice": false,
      "domain": {"data": "table", "field": "value"},
      "domainMin": 0
    },
    {
      "name": "color",
      "type": "ordinal",
      "domain": {"data": "table", "field": "category"},
      "range": {"scheme": "category10"}
    }
  ],

  "encode": {
    "enter": {
      "x": {"signal": "radius"},
      "y": {"signal": "radius"}
    }
  },

  "marks": [
    {
      "type": "group",
      "name": "categories",
      "zindex": 1,
      "from": {
        "facet": {"data": "table", "name": "facet", "groupby": ["category"]}
      },
      "marks": [
        {
          "type": "line",
          "name": "category-line",
          "from": {"data": "facet"},
          "encode": {
            "enter": {
              "interpolate": {"value": "linear-closed"},
              "x": {"signal": "scale('radial', datum.value) * cos(scale('angular', datum.key))"},
              "y": {"signal": "scale('radial', datum.value) * sin(scale('angular', datum.key))"},
              "stroke": {"scale": "color", "field": "category"},
              "strokeWidth": {"value": 1},
              "fill": {"scale": "color", "field": "category"},
              "fillOpacity": {"value": 0.1}
            }
          }
        },
        {
          "type": "text",
          "name": "value-text",
          "from": {"data": "category-line"},
          "encode": {
            "enter": {
              "x": {"signal": "datum.x"},
              "y": {"signal": "datum.y"},
              "text": {"signal": "datum.datum.value"},
              "align": {"value": "center"},
              "baseline": {"value": "middle"},
              "fill": {"value": "black"}
            }
          }
        }
      ]
    },
    {
      "type": "rule",
      "name": "radial-grid",
      "from": {"data": "keys"},
      "zindex": 0,
      "encode": {
        "enter": {
          "x": {"value": 0},
          "y": {"value": 0},
          "x2": {"signal": "radius * cos(scale('angular', datum.key))"},
          "y2": {"signal": "radius * sin(scale('angular', datum.key))"},
          "stroke": {"value": "lightgray"},
          "strokeWidth": {"value": 1}
        }
      }
    },
    {
      "type": "text",
      "name": "key-label",
      "from": {"data": "keys"},
      "zindex": 1,
      "encode": {
        "enter": {
          "x": {"signal": "(radius + 5) * cos(scale('angular', datum.key))"},
          "y": {"signal": "(radius + 5) * sin(scale('angular', datum.key))"},
          "text": {"field": "key"},
          "align": [
            {
              "test": "abs(scale('angular', datum.key)) > PI / 2",
              "value": "right"
            },
            {
              "value": "left"
            }
          ],
          "baseline": [
            {
              "test": "scale('angular', datum.key) > 0", "value": "top"
            },
            {
              "test": "scale('angular', datum.key) == 0", "value": "middle"
            },
            {
              "value": "bottom"
            }
          ],
          "fill": {"value": "black"},
          "fontWeight": {"value": "bold"}
        }
      }
    },
    {
      "type": "line",
      "name": "outer-line",
      "from": {"data": "radial-grid"},
      "encode": {
        "enter": {
          "interpolate": {"value": "linear-closed"},
          "x": {"field": "x2"},
          "y": {"field": "y2"},
          "stroke": {"value": "lightgray"},
          "strokeWidth": {"value": 1}
        }
      }
    }
  ]
}
"""

# ╔═╡ 9e9c86a9-5473-42a0-98f4-81205c075862
vegalite"""
{
  "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
  "description": "A simple donut chart with embedded data.",
  "data": {
    "values": [
      {"category": 1, "value": 4},
      {"category": 2, "value": 6},
      {"category": 3, "value": 10},
      {"category": 4, "value": 3},
      {"category": 5, "value": 7},
      {"category": 6, "value": 8}
    ]
  },
  "mark": {"type": "arc", "innerRadius": 50},
  "encoding": {
    "theta": {"field": "value", "type": "quantitative"},
    "color": {"field": "category", "type": "nominal"}
  },
  "view": {"stroke": null}
}
"""

# ╔═╡ e908cf0f-2fcc-49a6-adcd-89d5fb7fc300
md"""
Input Data for Pie Chart: $(@bind raw_data TextField(default = "50, 15, 70"))
"""

# ╔═╡ a948eeaf-c883-48de-8e07-99403a9e8bf8
data = try
	parse.([Int], split(replace(raw_data, ',' => ' ')))
catch e
	[100, 300]
end

# ╔═╡ 7850fb68-2743-4376-b75e-3c4ad8d8e868
named_data = [
	(category=i, value=d) for (i,d) in enumerate(data)
]

# ╔═╡ f020ebb4-be17-42ea-831d-1d3071f511f1
vl_piechart = """
{
  "\$schema": "https://vega.github.io/schema/vega-lite/v5.json",
  "description": "A simple donut chart with embedded data.",
  "data": {
    "values": $(JSON.json(named_data))
  },
  "mark": {"type": "arc", "innerRadius": 50},
  "encoding": {
    "theta": {"field": "value", "type": "quantitative"},
    "color": {"field": "category", "type": "nominal"}
  },
  "view": {"stroke": null}
}
"""

# ╔═╡ e5e8f9f0-5db3-4f17-93a9-b8d4e210f347
Kroki.Diagram(:vegalite , vl_piechart)

# ╔═╡ b51157cc-2225-4db7-ad15-040321fdf421
md"""
## Svgbob

[Svgbob Editor and Examples](https://ivanceras.github.io/svgbob-editor/)
"""

# ╔═╡ 7a716482-11c3-4079-a71e-5abe2466e779
svgbob"""

       +10-15V           ___0,047R
      *---------o-----o-|___|-o--o---------o----o-------.
    + |         |     |       |  |         |    |       |
    -===-      _|_    |       | .+.        |    |       |
    -===-      .-.    |       | | | 2k2    |    |       |
    -===-    470| +   |       | | |        |    |      _|_
    - |       uF|     '--.    | '+'       .+.   |      \ / LED
      +---------o        |6   |7 |8    1k | |   |      -+-
             ___|___   .-+----+--+--.     | |   |       |
              -═══-    |            |     '+'   |       |
                -      |            |1     |  |/  BC    |
               GND     |            +------o--+   547   |
                       |            |      |  |`>       |
                       |            |     ,+.   |       |
               .-------+            | 220R| |   o----||-+  IRF9Z34
               |       |            |     | |   |    |+->
               |       |  MC34063   |     `+'   |    ||-+
               |       |            |      |    |       |  BYV29     -12V6
               |       |            |      '----'       o--|<-o----o--X OUT
 6000 micro  - | +     |            |2                  |     |    |
 Farad, 40V ___|_____  |            |--o                C|    |    |
 Capacitor  ~ ~ ~ ~ ~  |            | GND         30uH  C|    |   --- 470
               |       |            |3      1nF         C|    |   ###  uF
               |       |            |-------||--.       |     |    | +
               |       '-----+----+-'           |      GND    |   GND
               |            5|   4|             |             |
               |             |    '-------------o-------------o
               |             |                           ___  |
               `-------------*------/\/\/------------o--|___|-'
                                     2k              |       1k0
                                                    .+.
                                                    | | 5k6 + 3k3
                                                    | | in Serie
                                                    '+'
                                                     |
                                                    GND

"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
JSON = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
Kroki = "b3565e16-c1f2-4fe9-b4ab-221c88942068"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
JSON = "~0.21.2"
Kroki = "~0.1.0"
PlutoUI = "~0.7.9"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "a32185f5428d3986f47c2ab78b1f216d5e6cc96f"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.5"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "MbedTLS", "Sockets"]
git-tree-sha1 = "c7ec02c4c6a039a98a15f955462cd7aea5df4508"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.8.19"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Kroki]]
deps = ["Base64", "CodecZlib", "DocStringExtensions", "HTTP"]
git-tree-sha1 = "1f0c3d257c94012f79d0381914460b2339fe1be9"
uuid = "b3565e16-c1f2-4fe9-b4ab-221c88942068"
version = "0.1.0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "477bf42b4d1496b454c10cce46645bb5b8a0cf2c"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.2"

[[PlutoUI]]
deps = ["Base64", "Dates", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "Suppressor"]
git-tree-sha1 = "44e225d5837e2a2345e69a1d1e01ac2443ff9fcb"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.9"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "5f6c21241f0f655da3952fd60aa18477cf96c220"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.1.0"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "216b95ea110b5972db65aa90f88d8d89dcb8851c"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.6"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
"""

# ╔═╡ Cell order:
# ╟─eca0e01d-fad4-494f-9f09-700bfb6ea89f
# ╠═bbb566cd-8176-4c5b-a6e9-460045c47c0a
# ╠═6b0df1fb-5471-4eb5-8cbb-e3f8bfdfe8b9
# ╟─f124a2a2-5276-4550-aba7-bdbf3e756c96
# ╟─9d58e82c-84d3-4c60-995f-7791156da2b0
# ╟─c4630307-cc1c-44ad-854e-816e6afaa5e6
# ╟─b84c4f05-b966-4cfc-841d-94731ceb4337
# ╟─e4ce8fe6-ab10-4785-99e6-3af2a3a54fac
# ╟─068eed4a-cd89-4ed9-aff2-6ac549179992
# ╟─20d45bda-f252-439c-9343-7d05ae15f76f
# ╟─1ceac8df-7f90-429d-bc4b-0a35c190493a
# ╟─ac07b3e1-ce18-4870-984c-aabefda6f430
# ╟─7aed8ffa-64f3-4b5e-a153-c58a2c2c5f10
# ╟─e6d95e94-5add-484a-831a-1828e40e213c
# ╟─ec241a76-580d-480c-9a96-296845d61663
# ╟─f014806d-92f9-43e0-aa2f-0a1c7fd9964b
# ╟─70510d7e-37ab-424d-bdfa-b04ccbd23284
# ╟─063692b9-b0a7-4664-b1dc-bfae4a662f46
# ╟─8409dcec-506b-49bc-935f-a9ef8e1c8792
# ╟─9d84dd97-3e51-4944-bcc9-be4d6c4fb71e
# ╟─0212006d-8fed-4df5-945e-a51c165be41d
# ╟─796dc404-3e98-4b57-893f-57e42eb7d304
# ╟─a6fded94-f27f-4fe9-a3d7-7367cfcd8c1b
# ╟─c0ec9039-817b-4a9b-96d0-b6f8b6dbb719
# ╟─43eb53b5-09f1-4969-8b2c-81d2a7cb738c
# ╟─9e9c86a9-5473-42a0-98f4-81205c075862
# ╠═1cc9a4dc-adec-47f1-9862-66ba2510b546
# ╟─a948eeaf-c883-48de-8e07-99403a9e8bf8
# ╟─7850fb68-2743-4376-b75e-3c4ad8d8e868
# ╟─f020ebb4-be17-42ea-831d-1d3071f511f1
# ╟─e908cf0f-2fcc-49a6-adcd-89d5fb7fc300
# ╟─e5e8f9f0-5db3-4f17-93a9-b8d4e210f347
# ╟─b51157cc-2225-4db7-ad15-040321fdf421
# ╟─7a716482-11c3-4079-a71e-5abe2466e779
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
