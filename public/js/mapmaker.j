var $mapmaker = $mapmaker || {};
$mapmaker.scope = {};
$mapmaker.ASSUME_ES5 = !1;
$mapmaker.ASSUME_NO_NATIVE_MAP = !1;
$mapmaker.ASSUME_NO_NATIVE_SET = !1;
$mapmaker.defineProperty =
  $mapmaker.ASSUME_ES5 || "function" == typeof Object.defineProperties 
  ? Object.defineProperty
    : function(a, b, c) {
        a != Array.prototype && a != Object.prototype && (a[b] = c.value);
      };
$mapmaker.getGlobal = function(glob) {
  return "undefined" != typeof window && window === glob
    ? glob
    : "undefined" != typeof global && null != global
    ? global
    : glob;
};
$mapmaker.global = $mapmaker.getGlobal(this);
$mapmaker.polyfill = function(a, b, c, d) {
  if (b) {
    c = $mapmaker.global;
    a = a.split(".");
    for (d = 0; d < a.length - 1; d++) {
      var e = a[d];
      e in c || (c[e] = {});
      c = c[e];
    }
    a = a[a.length - 1];
    d = c[a];
    b = b(d);
    b != d &&
      null != b &&
      $mapmaker.defineProperty(c, a, {
        configurable: !0,
        writable: !0,
        value: b
      });
  }
};
$mapmaker.polyfill(
  "Array.prototype.fill",
  function(a) {
    return a
      ? a
      : function(a, c, d) {
          var b = this.length || 0;
          0 > c && (c = Math.max(0, b + c));
          if (null == d || d > b) d = b;
          d = Number(d);
          0 > d && (d = Math.max(0, b + d));
          for (c = Number(c || 0); c < d; c++) this[c] = a;
          return this;
        };
  },
  "es6",
  "es3"
);=
SVG.Circle.prototype.aid = 0;
var filename = "",
  drawing = new SVG("graph");
function createObjectURL(a) {
  return window.URL
    ? window.URL.createObjectURL(a)
    : window.webkitURL.createObjectURL(a);
}
function revokeObjectURL(a) {
  return window.URL
    ? window.URL.revokeObjectURL(a)
    : window.webkitURL.revokeObjectURL(a);
}
function handleFile() {
  if (this.files.length) {
    var img = new Image();
    img.src = createObjectURL(this.files[0]);
    img.onload = function() {
      drawing.node.setAttribute("viewBox", "0 0 " + img.width + " " + img.height);
    };
    filename = this.files[0].name;
    document.getElementById("mappedImage").setAttribute("src", img.src);
    document.getElementById("mappedContent").style.display = "unset";
  }
  generate_html();
}
function handleDragFile(file) {
  var img = new Image();
  img.src = createObjectURL(file);
  img.onload = function() {
    drawing.node.setAttribute("viewBox", "0 0 " + img.width + " " + img.height);
  };
  filename = file.name;
  document.getElementById("mappedImage").setAttribute("src", img.src);
  document.getElementById("mappedContent").style.display = "unset";
  generate_html();
}
function handleDrop(a) {
  a.preventDefault();
  if (a.dataTransfer.items)
    for (var b = 0; b < a.dataTransfer.items.length; b++)
      if ("file" === a.dataTransfer.items[b].kind) {
        var c = a.dataTransfer.items[b].getAsFile();
        handleDragFile(c);
      }
  removeDragData(a);
}
function removeDragData(a) {
  a.dataTransfer.items
    ? a.dataTransfer.items.clear()
    : a.dataTransfer.clearData();
  document.getElementById("dragBox").style.display = "none";
}
function handleDrag(a) {
  a.preventDefault();
  console.log("dragover");
  document.getElementById("dragBox").style.display = "unset";
}
document.getElementById("file").addEventListener("change", handleFile, !1);
document.addEventListener("drop", handleDrop, !1);
document.addEventListener("dragover", handleDrag, !1);
document.addEventListener(
  "dragend",
  function() {
    console.log("dragend");
    document.getElementById("dragBox").style.display = "none";
  },
  !1
);
var set_shape = "circle";
function delete_shape(a, b) {
  b = void 0 === b ? !1 : b;
  console.log("109");
  if (b) (r = rects[b]), console.log("id", r, b);
  else if (-1 < shape_selected)
    (r = rects[shape_selected]), console.log("shape_selected", r);
  else return !1;
  "polygon" == r.type ? r.selectize(!1, { deepSelect: !0 }) : r.selectize(!1);
  r.remove();
  rects.splice(shape_selected, 1);
  shape_selected = -1;
  hi = document.getElementById("href-" + r.aid);
  ti = document.getElementById("title-" + r.aid);
  hi.parentNode.parentNode.removeChild(hi.parentNode);
  fix_aids();
}
function fix_aids() {
  for (i = 0; i < rects.length; i++)
    (r = rects[i]),
      (document.getElementById("href-" + r.aid).id = "href-" + i),
      (document.getElementById("title-" + r.aid).id = "title-" + i),
      (r.aid = i);
}
var rects = [],
  in_shape = !1,
  shape_selected = -1;
function deselect_shapes() {
  if (-1 < shape_selected) {
    for (i = 0; i < rects.length; i++) rects[i].selectize(!1);
    shape_selected = -1;
  }
}
function generate_html() {
  var a = '<img src="' + filename + '" usemap="#image_map">\n';
  a += '<map name="image_map">\n';
  for (i = 0; i < rects.length; i++) {
    r = rects[i];
    type = r.type;
    "rect" == type
      ? ((start = Math.round(r.attr("x")) + "," + Math.round(r.attr("y"))),
        (end =
          Math.round(r.attr("x") + r.width()) +
          "," +
          Math.round(r.attr("y") + r.height())),
        (coords = start + "," + end))
      : "circle" == type
      ? ((start = Math.round(r.attr("cx")) + "," + Math.round(r.attr("cy"))),
        (radius = Math.round(r.attr("r"))),
        (coords = start + "," + radius))
      : "polygon" == type &&
        (console.log("generating polygon coords"),
        (coords = ""),
        (complete = !1),
        r
          .attr("points")
          .split(/[, ]/)
          .forEach(function(a) {
            coords += Math.round(a);
            complete
              ? ((coords += " "), (complete = !1))
              : ((coords += ","), (complete = !0));
          }));
    var b = document.getElementById("href-" + r.aid).value,
      c = document.getElementById("title-" + r.aid).value;
    a +=
      '  <area alt="' +
      c +
      '" title="' +
      c +
      '" href="' +
      b +
      '" coords="' +
      coords +
      '" shape="' +
      type +
      '">\n';
  }
  a += "</map>\n";
  document.getElementById("ta_html").value = a;
}
function add_href_input(a) {
  var b = document.createElement("fieldset"),
    c = document.createElement("input"),
    d = document.createElement("input");
  b.classList.add("pure-group");
  b.appendChild(c);
  b.appendChild(d);
  c.id = "href-" + a.aid;
  d.id = "title-" + a.aid;
  c.setAttribute("type", "text");
  c.setAttribute("placeholder", "href");
  d.setAttribute("type", "text");
  d.setAttribute("placeholder", "title");
  c.addEventListener(
    "keyup",
    function() {
      generate_html();
    },
    !1
  );
  d.addEventListener(
    "keyup",
    function() {
      generate_html();
    },
    !1
  );
  c.addEventListener(
    "focus",
    function() {
      console.log(a.aid);
      deselect_shapes();
      a.selectize(!0);
      ("rect" == a.type) | ("circle" == a.type)
        ? a.selectize(!0, { deepSelect: !0, rotationPoint: !1 }).resize()
        : a.selectize(!0, { deepSelect: !1, rotationPoint: !1 }).resize();
      shape_selected = a.aid;
    },
    !1
  );
  d.addEventListener(
    "focus",
    function() {
      console.log(a.aid);
      deselect_shapes();
      a.selectize(!0);
      ("rect" == a.type) | ("circle" == a.type)
        ? a.selectize(!0, { deepSelect: !0, rotationPoint: !1 }).resize()
        : a.selectize(!0, { deepSelect: !1, rotationPoint: !1 }).resize();
      shape_selected = a.aid;
    },
    !1
  );
  document.getElementById("form_href").appendChild(b);
}
document
  .getElementById("drawCircle")
  .addEventListener("click", set_circle, !1);
document.getElementById("delete").addEventListener("click", delete_shape, !1);
drawing.on(
  "mousedown",
  function(a) {
    deselect_shapes();
    if (in_shape) return !1;
    "rect" == set_shape
      ? rects.push(drawing.rect())
      : "circle" == set_shape
      ? rects.push(drawing.circle())
      : "poly" == set_shape && rects.push(drawing.polygon());
    in_shape = !0;
    r = rects[rects.length - 1];
    r.aid = rects.length - 1;
    "poly" == set_shape
      ? r.draw().opacity(".3")
      : r
          .draw(a)
          .fill("#333")
          .opacity(".3");
    if ("poly" == set_shape)
      r.on("drawstart", function(a) {
        document.addEventListener("keydown", function(a) {
          console.log("keydown", a.keyCode);
          if (13 == a.keyCode || 27 == a.keyCode)
            r.draw("done"), r.off("drawstart"), (in_shape = !1);
        });
      });
    r.draggable().on("dragmove", function(a) {
      generate_html();
    });
    r.on("drawstop", function() {
      console.log("drawstop");
      add_href_input(this);
    });
    r.on(
      "mousedown",
      function(a) {
        deselect_shapes();
        "poly" == set_shape
          ? this.selectize(!0, { deepSelect: !0, rotationPoint: !1 }).resize()
          : this.selectize(!0, { deepSelect: !1, rotationPoint: !1 }).resize();
        shape_selected = this.aid;
      },
      !1
    );
  },
  !1
);
drawing.on(
  "mouseup",
  function(a) {
    if ("poly" == set_shape) return !1;
    r = rects[rects.length - 1];
    r.draw("stop", a);
    in_shape = !1;
    if (0 == r.width() || 0 == r.height())
      console.log(
        "deleting empty shape ",
        r.attr("x"),
        r.attr("y"),
        r.width(),
        r.height()
      ),
        delete_shape(a, r.aid);
    generate_html();
  },
  !1
);
document.getElementById("ta_html").value = "";
