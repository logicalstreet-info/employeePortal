/*! choices.js v7.0.0 | (c) 2019 Josh Johnson | https://github.com/jshjohnson/Choices#readme */ ! function(e, t) {
	"object" == typeof exports && "object" == typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define([], t) : "object" == typeof exports ? exports.Choices = t() : e.Choices = t()
}(window, function() {
	return function(e) {
		var t = {};

		function i(n) {
			if (t[n]) return t[n].exports;
			var o = t[n] = {
				i: n,
				l: !1,
				exports: {}
			};
			return e[n].call(o.exports, o, o.exports, i), o.l = !0, o.exports
		}
		return i.m = e, i.c = t, i.d = function(e, t, n) {
			i.o(e, t) || Object.defineProperty(e, t, {
				enumerable: !0,
				get: n
			})
		}, i.r = function(e) {
			"undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
				value: "Module"
			}), Object.defineProperty(e, "__esModule", {
				value: !0
			})
		}, i.t = function(e, t) {
			if (1 & t && (e = i(e)), 8 & t) return e;
			if (4 & t && "object" == typeof e && e && e.__esModule) return e;
			var n = Object.create(null);
			if (i.r(n), Object.defineProperty(n, "default", {
					enumerable: !0,
					value: e
				}), 2 & t && "string" != typeof e)
				for (var o in e) i.d(n, o, function(t) {
					return e[t]
				}.bind(null, o));
			return n
		}, i.n = function(e) {
			var t = e && e.__esModule ? function() {
				return e.default
			} : function() {
				return e
			};
			return i.d(t, "a", t), t
		}, i.o = function(e, t) {
			return Object.prototype.hasOwnProperty.call(e, t)
		}, i.p = "/public/assets/scripts/", i(i.s = 9)
	}([function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.diff = t.cloneObject = t.existsInArray = t.isIE11 = t.fetchFromObject = t.getWindowHeight = t.dispatchEvent = t.sortByScore = t.sortByAlpha = t.calcWidthOfInput = t.strToEl = t.sanitise = t.isScrolledIntoView = t.getAdjacentEl = t.findAncestorByAttrName = t.wrap = t.isElement = t.isType = t.getType = t.generateId = t.generateChars = t.getRandomNumber = void 0;
		var n = function(e, t) {
			return Math.floor(Math.random() * (t - e) + e)
		};
		t.getRandomNumber = n;
		var o = function(e) {
			for (var t = "", i = 0; i < e; i++) {
				t += n(0, 36).toString(36)
			}
			return t
		};
		t.generateChars = o;
		t.generateId = function(e, t) {
			var i = e.id || e.name && "".concat(e.name, "-").concat(o(2)) || o(4);
			return i = i.replace(/(:|\.|\[|\]|,)/g, ""), i = "".concat(t, "-").concat(i)
		};
		var r = function(e) {
			return Object.prototype.toString.call(e).slice(8, -1)
		};
		t.getType = r;
		var s = function(e, t) {
			return null != t && r(t) === e
		};
		t.isType = s;
		t.isElement = function(e) {
			return e instanceof Element
		};
		t.wrap = function(e) {
			var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : document.createElement("div");
			return e.nextSibling ? e.parentNode.insertBefore(t, e.nextSibling) : e.parentNode.appendChild(t), t.appendChild(e)
		};
		t.findAncestorByAttrName = function(e, t) {
			for (var i = e; i;) {
				if (i.hasAttribute(t)) return i;
				i = i.parentElement
			}
			return null
		};
		t.getAdjacentEl = function(e, t) {
			var i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1;
			if (e && t) {
				var n = e.parentNode.parentNode,
					o = Array.from(n.querySelectorAll(t)),
					r = o.indexOf(e);
				return o[r + (i > 0 ? 1 : -1)]
			}
		};
		t.isScrolledIntoView = function(e, t) {
			var i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1;
			if (e) return i > 0 ? t.scrollTop + t.offsetHeight >= e.offsetTop + e.offsetHeight : e.offsetTop >= t.scrollTop
		};
		var a = function(e) {
			return s("String", e) ? e.replace(/&/g, "&amp;").replace(/>/g, "&rt;").replace(/</g, "&lt;").replace(/"/g, "&quot;") : e
		};
		t.sanitise = a;
		var c, l = (c = document.createElement("div"), function(e) {
			var t = e.trim();
			c.innerHTML = t;
			for (var i = c.children[0]; c.firstChild;) c.removeChild(c.firstChild);
			return i
		});
		t.strToEl = l;
		t.calcWidthOfInput = function(e, t) {
			var i = e.value || e.placeholder,
				n = e.offsetWidth;
			if (i) {
				var o = l("<span>".concat(a(i), "</span>"));
				if (o.style.position = "absolute", o.style.padding = "0", o.style.top = "-9999px", o.style.left = "-9999px", o.style.width = "auto", o.style.whiteSpace = "pre", document.body.contains(e) && window.getComputedStyle) {
					var r = window.getComputedStyle(e);
					r && (o.style.fontSize = r.fontSize, o.style.fontFamily = r.fontFamily, o.style.fontWeight = r.fontWeight, o.style.fontStyle = r.fontStyle, o.style.letterSpacing = r.letterSpacing, o.style.textTransform = r.textTransform, o.style.padding = r.padding)
				}
				document.body.appendChild(o), requestAnimationFrame(function() {
					i && o.offsetWidth !== e.offsetWidth && (n = o.offsetWidth + 4), document.body.removeChild(o), t.call(void 0, "".concat(n, "px"))
				})
			} else t.call(void 0, "".concat(n, "px"))
		};
		t.sortByAlpha = function(e, t) {
			var i = "".concat(e.label || e.value).toLowerCase(),
				n = "".concat(t.label || t.value).toLowerCase();
			return i < n ? -1 : i > n ? 1 : 0
		};
		t.sortByScore = function(e, t) {
			return e.score - t.score
		};
		t.dispatchEvent = function(e, t) {
			var i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : null,
				n = new CustomEvent(t, {
					detail: i,
					bubbles: !0,
					cancelable: !0
				});
			return e.dispatchEvent(n)
		};
		t.getWindowHeight = function() {
			var e = document.body,
				t = document.documentElement;
			return Math.max(e.scrollHeight, e.offsetHeight, t.clientHeight, t.scrollHeight, t.offsetHeight)
		};
		t.fetchFromObject = function e(t, i) {
			var n = i.indexOf(".");
			return n > -1 ? e(t[i.substring(0, n)], i.substr(n + 1)) : t[i]
		};
		t.isIE11 = function() {
			return !(!navigator.userAgent.match(/Trident/) || !navigator.userAgent.match(/rv[ :]11/))
		};
		t.existsInArray = function(e, t) {
			var i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "value";
			return e.some(function(e) {
				return s("String", t) ? e[i] === t.trim() : e[i] === t
			})
		};
		t.cloneObject = function(e) {
			return JSON.parse(JSON.stringify(e))
		};
		t.diff = function(e, t) {
			var i = Object.keys(e).sort(),
				n = Object.keys(t).sort();
			return i.filter(function(e) {
				return n.indexOf(e) < 0
			})
		}
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.SCROLLING_SPEED = t.KEY_CODES = t.ACTION_TYPES = t.EVENTS = t.DEFAULT_CONFIG = t.DEFAULT_CLASSNAMES = void 0;
		var n = i(0),
			o = {
				containerOuter: "choices",
				containerInner: "choices__inner",
				input: "choices__input",
				inputCloned: "choices__input--cloned",
				list: "choices__list",
				listItems: "choices__list--multiple",
				listSingle: "choices__list--single",
				listDropdown: "choices__list--dropdown",
				item: "choices__item",
				itemSelectable: "choices__item--selectable",
				itemDisabled: "choices__item--disabled",
				itemChoice: "choices__item--choice",
				placeholder: "choices__placeholder",
				group: "choices__group",
				groupHeading: "choices__heading",
				button: "choices__button",
				activeState: "is-active",
				focusState: "is-focused",
				openState: "is-open",
				disabledState: "is-disabled",
				highlightedState: "is-highlighted",
				hiddenState: "is-hidden",
				flippedState: "is-flipped",
				loadingState: "is-loading",
				noResults: "has-no-results",
				noChoices: "has-no-choices"
			};
		t.DEFAULT_CLASSNAMES = o;
		var r = {
			items: [],
			choices: [],
			silent: !1,
			renderChoiceLimit: -1,
			maxItemCount: -1,
			addItems: !0,
			addItemFilterFn: null,
			removeItems: !0,
			removeItemButton: !1,
			editItems: !1,
			duplicateItemsAllowed: !0,
			delimiter: ",",
			paste: !0,
			searchEnabled: !0,
			searchChoices: !0,
			searchFloor: 1,
			searchResultLimit: 4,
			searchFields: ["label", "value"],
			position: "auto",
			resetScrollPosition: !0,
			shouldSort: !0,
			shouldSortItems: !1,
			sortFn: n.sortByAlpha,
			placeholder: !0,
			placeholderValue: null,
			searchPlaceholderValue: null,
			prependValue: null,
			appendValue: null,
			renderSelectedChoices: "auto",
			loadingText: "Loading...",
			noResultsText: "No results found",
			noChoicesText: "No choices to choose from",
			itemSelectText: "Press to select",
			uniqueItemText: "Only unique values can be added",
			customAddItemText: "Only values matching specific conditions can be added",
			addItemText: function(e) {
				return 'Press Enter to add <b>"'.concat((0, n.sanitise)(e), '"</b>')
			},
			maxItemText: function(e) {
				return "Only ".concat(e, " values can be added")
			},
			itemComparer: function(e, t) {
				return e === t
			},
			fuseOptions: {
				includeScore: !0
			},
			callbackOnInit: null,
			callbackOnCreateTemplates: null,
			classNames: o
		};
		t.DEFAULT_CONFIG = r;
		t.EVENTS = {
			showDropdown: "showDropdown",
			hideDropdown: "hideDropdown",
			change: "change",
			choice: "choice",
			search: "search",
			addItem: "addItem",
			removeItem: "removeItem",
			highlightItem: "highlightItem",
			highlightChoice: "highlightChoice"
		};
		t.ACTION_TYPES = {
			ADD_CHOICE: "ADD_CHOICE",
			FILTER_CHOICES: "FILTER_CHOICES",
			ACTIVATE_CHOICES: "ACTIVATE_CHOICES",
			CLEAR_CHOICES: "CLEAR_CHOICES",
			ADD_GROUP: "ADD_GROUP",
			ADD_ITEM: "ADD_ITEM",
			REMOVE_ITEM: "REMOVE_ITEM",
			HIGHLIGHT_ITEM: "HIGHLIGHT_ITEM",
			CLEAR_ALL: "CLEAR_ALL"
		};
		t.KEY_CODES = {
			BACK_KEY: 46,
			DELETE_KEY: 8,
			ENTER_KEY: 13,
			A_KEY: 65,
			ESC_KEY: 27,
			UP_KEY: 38,
			DOWN_KEY: 40,
			PAGE_UP_KEY: 33,
			PAGE_DOWN_KEY: 34
		};
		t.SCROLLING_SPEED = 4
	}, function(e, t, i) {
		"use strict";
		(function(e, n) {
			var o, r = i(7);
			o = "undefined" != typeof self ? self : "undefined" != typeof window ? window : void 0 !== e ? e : n;
			var s = Object(r.a)(o);
			t.a = s
		}).call(this, i(3), i(14)(e))
	}, function(e, t) {
		var i;
		i = function() {
			return this
		}();
		try {
			i = i || new Function("return this")()
		} catch (e) {
			"object" == typeof window && (i = window)
		}
		e.exports = i
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = void 0;
		var n = i(0);

		function o(e, t) {
			for (var i = 0; i < t.length; i++) {
				var n = t[i];
				n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
			}
		}
		var r = function() {
			function e(t) {
				var i = t.element,
					o = t.classNames;
				if (function(e, t) {
						if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
					}(this, e), Object.assign(this, {
						element: i,
						classNames: o
					}), !(0, n.isElement)(i)) throw new TypeError("Invalid element passed");
				this.isDisabled = !1
			}
			var t, i, r;
			return t = e, (i = [{
				key: "conceal",
				value: function() {
					this.element.classList.add(this.classNames.input), this.element.classList.add(this.classNames.hiddenState), this.element.tabIndex = "-1";
					var e = this.element.getAttribute("style");
					e && this.element.setAttribute("data-choice-orig-style", e), this.element.setAttribute("aria-hidden", "true"), this.element.setAttribute("data-choice", "active")
				}
			}, {
				key: "reveal",
				value: function() {
					this.element.classList.remove(this.classNames.input), this.element.classList.remove(this.classNames.hiddenState), this.element.removeAttribute("tabindex");
					var e = this.element.getAttribute("data-choice-orig-style");
					e ? (this.element.removeAttribute("data-choice-orig-style"), this.element.setAttribute("style", e)) : this.element.removeAttribute("style"), this.element.removeAttribute("aria-hidden"), this.element.removeAttribute("data-choice"), this.element.value = this.element.value
				}
			}, {
				key: "enable",
				value: function() {
					this.element.removeAttribute("disabled"), this.element.disabled = !1, this.isDisabled = !1
				}
			}, {
				key: "disable",
				value: function() {
					this.element.setAttribute("disabled", ""), this.element.disabled = !0, this.isDisabled = !0
				}
			}, {
				key: "triggerEvent",
				value: function(e, t) {
					(0, n.dispatchEvent)(this.element, e, t)
				}
			}, {
				key: "value",
				get: function() {
					return this.element.value
				}
			}]) && o(t.prototype, i), r && o(t, r), e
		}();
		t.default = r
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = t.TEMPLATES = void 0;
		var n, o = (n = i(27)) && n.__esModule ? n : {
				default: n
			},
			r = i(0);

		function s(e, t, i) {
			return t in e ? Object.defineProperty(e, t, {
				value: i,
				enumerable: !0,
				configurable: !0,
				writable: !0
			}) : e[t] = i, e
		}
		var a = {
			containerOuter: function(e, t, i, n, o, s) {
				var a = n ? 'tabindex="0"' : "",
					c = i ? 'role="listbox"' : "",
					l = "";
				return i && o && (c = 'role="combobox"', l = 'aria-autocomplete="list"'), (0, r.strToEl)('\n      <div\n        class="'.concat(e.containerOuter, '"\n        data-type="').concat(s, '"\n        ').concat(c, "\n        ").concat(a, "\n        ").concat(l, '\n        aria-haspopup="true"\n        aria-expanded="false"\n        dir="').concat(t, '"\n        >\n      </div>\n    '))
			},
			containerInner: function(e) {
				return (0, r.strToEl)('\n      <div class="'.concat(e.containerInner, '"></div>\n    '))
			},
			itemList: function(e, t) {
				var i, n = (0, o.default)(e.list, (s(i = {}, e.listSingle, t), s(i, e.listItems, !t), i));
				return (0, r.strToEl)('\n      <div class="'.concat(n, '"></div>\n    '))
			},
			placeholder: function(e, t) {
				return (0, r.strToEl)('\n      <div class="'.concat(e.placeholder, '">\n        ').concat(t, "\n      </div>\n    "))
			},
			item: function(e, t, i) {
				var n, a, c = t.active ? 'aria-selected="true"' : "",
					l = t.disabled ? 'aria-disabled="true"' : "",
					u = (0, o.default)(e.item, (s(n = {}, e.highlightedState, t.highlighted), s(n, e.itemSelectable, !t.highlighted), s(n, e.placeholder, t.placeholder), n));
				return i ? (u = (0, o.default)(e.item, (s(a = {}, e.highlightedState, t.highlighted), s(a, e.itemSelectable, !t.disabled), s(a, e.placeholder, t.placeholder), a)), (0, r.strToEl)('\n        <div\n          class="'.concat(u, '"\n          data-item\n          data-id="').concat(t.id, '"\n          data-value="').concat(t.value, "\"\n          data-custom-properties='").concat(t.customProperties, "'\n          data-deletable\n          ").concat(c, "\n          ").concat(l, "\n          >\n          ").concat(t.label, '\x3c!--\n       --\x3e<button\n            type="button"\n            class="').concat(e.button, '"\n            data-button\n            aria-label="Remove item: \'').concat(t.value, "'\"\n            >\n            Remove item\n          </button>\n        </div>\n      "))) : (0, r.strToEl)('\n      <div\n        class="'.concat(u, '"\n        data-item\n        data-id="').concat(t.id, '"\n        data-value="').concat(t.value, '"\n        ').concat(c, "\n        ").concat(l, "\n        >\n        ").concat(t.label, "\n      </div>\n    "))
			},
			choiceList: function(e, t) {
				var i = t ? "" : 'aria-multiselectable="true"';
				return (0, r.strToEl)('\n      <div\n        class="'.concat(e.list, '"\n        dir="ltr"\n        role="listbox"\n        ').concat(i, "\n        >\n      </div>\n    "))
			},
			choiceGroup: function(e, t) {
				var i = t.disabled ? 'aria-disabled="true"' : "",
					n = (0, o.default)(e.group, s({}, e.itemDisabled, t.disabled));
				return (0, r.strToEl)('\n      <div\n        class="'.concat(n, '"\n        data-group\n        data-id="').concat(t.id, '"\n        data-value="').concat(t.value, '"\n        role="group"\n        ').concat(i, '\n        >\n        <div class="').concat(e.groupHeading, '">').concat(t.value, "</div>\n      </div>\n    "))
			},
			choice: function(e, t, i) {
				var n, a = t.groupId > 0 ? 'role="treeitem"' : 'role="option"',
					c = (0, o.default)(e.item, e.itemChoice, (s(n = {}, e.itemDisabled, t.disabled), s(n, e.itemSelectable, !t.disabled), s(n, e.placeholder, t.placeholder), n));
				return (0, r.strToEl)('\n      <div\n        class="'.concat(c, '"\n        data-select-text="').concat(i, '"\n        data-choice\n        data-id="').concat(t.id, '"\n        data-value="').concat(t.value, '"\n        ').concat(t.disabled ? 'data-choice-disabled aria-disabled="true"' : "data-choice-selectable", '\n        id="').concat(t.elementId, '"\n        ').concat(a, "\n        >\n        ").concat(t.label, "\n      </div>\n    "))
			},
			input: function(e) {
				var t = (0, o.default)(e.input, e.inputCloned);
				return (0, r.strToEl)('\n      <input\n        type="text"\n        class="'.concat(t, '"\n        autocomplete="off"\n        autocapitalize="off"\n        spellcheck="false"\n        role="textbox"\n        aria-autocomplete="list"\n        >\n    '))
			},
			dropdown: function(e) {
				var t = (0, o.default)(e.list, e.listDropdown);
				return (0, r.strToEl)('\n      <div\n        class="'.concat(t, '"\n        aria-expanded="false"\n        >\n      </div>\n    '))
			},
			notice: function(e, t) {
				var i, n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "",
					a = (0, o.default)(e.item, e.itemChoice, (s(i = {}, e.noResults, "no-results" === n), s(i, e.noChoices, "no-choices" === n), i));
				return (0, r.strToEl)('\n      <div class="'.concat(a, '">\n        ').concat(t, "\n      </div>\n    "))
			},
			option: function(e) {
				return (0, r.strToEl)('\n      <option value="'.concat(e.value, '" ').concat(e.active ? "selected" : "", " ").concat(e.disabled ? "disabled" : "", " ").concat(e.customProperties ? "data-custom-properties=".concat(e.customProperties) : "", ">").concat(e.label, "</option>\n    "))
			}
		};
		t.TEMPLATES = a;
		var c = a;
		t.default = c
	}, function(e, t, i) {
		"use strict";
		i.r(t);
		var n = i(8),
			o = "object" == typeof self && self && self.Object === Object && self,
			r = (n.a || o || Function("return this")()).Symbol,
			s = Object.prototype,
			a = s.hasOwnProperty,
			c = s.toString,
			l = r ? r.toStringTag : void 0;
		var u = function(e) {
				var t = a.call(e, l),
					i = e[l];
				try {
					e[l] = void 0;
					var n = !0
				} catch (e) {}
				var o = c.call(e);
				return n && (t ? e[l] = i : delete e[l]), o
			},
			h = Object.prototype.toString;
		var d = function(e) {
				return h.call(e)
			},
			f = "[object Null]",
			p = "[object Undefined]",
			v = r ? r.toStringTag : void 0;
		var m = function(e) {
			return null == e ? void 0 === e ? p : f : v && v in Object(e) ? u(e) : d(e)
		};
		var g = function(e, t) {
			return function(i) {
				return e(t(i))
			}
		}(Object.getPrototypeOf, Object);
		var _ = function(e) {
				return null != e && "object" == typeof e
			},
			y = "[object Object]",
			b = Function.prototype,
			E = Object.prototype,
			S = b.toString,
			I = E.hasOwnProperty,
			O = S.call(Object);
		var C = function(e) {
				if (!_(e) || m(e) != y) return !1;
				var t = g(e);
				if (null === t) return !0;
				var i = I.call(t, "constructor") && t.constructor;
				return "function" == typeof i && i instanceof i && S.call(i) == O
			},
			T = i(2),
			w = {
				INIT: "@@redux/INIT"
			};

		function k(e, t, i) {
			var n;
			if ("function" == typeof t && void 0 === i && (i = t, t = void 0), void 0 !== i) {
				if ("function" != typeof i) throw new Error("Expected the enhancer to be a function.");
				return i(k)(e, t)
			}
			if ("function" != typeof e) throw new Error("Expected the reducer to be a function.");
			var o = e,
				r = t,
				s = [],
				a = s,
				c = !1;

			function l() {
				a === s && (a = s.slice())
			}

			function u() {
				return r
			}

			function h(e) {
				if ("function" != typeof e) throw new Error("Expected listener to be a function.");
				var t = !0;
				return l(), a.push(e),
					function() {
						if (t) {
							t = !1, l();
							var i = a.indexOf(e);
							a.splice(i, 1)
						}
					}
			}

			function d(e) {
				if (!C(e)) throw new Error("Actions must be plain objects. Use custom middleware for async actions.");
				if (void 0 === e.type) throw new Error('Actions may not have an undefined "type" property. Have you misspelled a constant?');
				if (c) throw new Error("Reducers may not dispatch actions.");
				try {
					c = !0, r = o(r, e)
				} finally {
					c = !1
				}
				for (var t = s = a, i = 0; i < t.length; i++) {
					(0, t[i])()
				}
				return e
			}
			return d({
				type: w.INIT
			}), (n = {
				dispatch: d,
				subscribe: h,
				getState: u,
				replaceReducer: function(e) {
					if ("function" != typeof e) throw new Error("Expected the nextReducer to be a function.");
					o = e, d({
						type: w.INIT
					})
				}
			})[T.a] = function() {
				var e, t = h;
				return (e = {
					subscribe: function(e) {
						if ("object" != typeof e) throw new TypeError("Expected the observer to be an object.");

						function i() {
							e.next && e.next(u())
						}
						return i(), {
							unsubscribe: t(i)
						}
					}
				})[T.a] = function() {
					return this
				}, e
			}, n
		}

		function A(e, t) {
			var i = t && t.type;
			return "Given action " + (i && '"' + i.toString() + '"' || "an action") + ', reducer "' + e + '" returned undefined. To ignore an action, you must explicitly return the previous state. If you want this reducer to hold no value, you can return null instead of undefined.'
		}

		function L(e) {
			for (var t = Object.keys(e), i = {}, n = 0; n < t.length; n++) {
				var o = t[n];
				0, "function" == typeof e[o] && (i[o] = e[o])
			}
			var r = Object.keys(i);
			var s = void 0;
			try {
				! function(e) {
					Object.keys(e).forEach(function(t) {
						var i = e[t];
						if (void 0 === i(void 0, {
								type: w.INIT
							})) throw new Error('Reducer "' + t + "\" returned undefined during initialization. If the state passed to the reducer is undefined, you must explicitly return the initial state. The initial state may not be undefined. If you don't want to set a value for this reducer, you can use null instead of undefined.");
						if (void 0 === i(void 0, {
								type: "@@redux/PROBE_UNKNOWN_ACTION_" + Math.random().toString(36).substring(7).split("").join(".")
							})) throw new Error('Reducer "' + t + "\" returned undefined when probed with a random type. Don't try to handle " + w.INIT + ' or other actions in "redux/*" namespace. They are considered private. Instead, you must return the current state for any unknown actions, unless it is undefined, in which case you must return the initial state, regardless of the action type. The initial state may not be undefined, but can be null.')
					})
				}(i)
			} catch (e) {
				s = e
			}
			return function() {
				var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
					t = arguments[1];
				if (s) throw s;
				for (var n = !1, o = {}, a = 0; a < r.length; a++) {
					var c = r[a],
						l = i[c],
						u = e[c],
						h = l(u, t);
					if (void 0 === h) {
						var d = A(c, t);
						throw new Error(d)
					}
					o[c] = h, n = n || h !== u
				}
				return n ? o : e
			}
		}

		function x(e, t) {
			return function() {
				return t(e.apply(void 0, arguments))
			}
		}

		function P(e, t) {
			if ("function" == typeof e) return x(e, t);
			if ("object" != typeof e || null === e) throw new Error("bindActionCreators expected an object or a function, instead received " + (null === e ? "null" : typeof e) + '. Did you write "import ActionCreators from" instead of "import * as ActionCreators from"?');
			for (var i = Object.keys(e), n = {}, o = 0; o < i.length; o++) {
				var r = i[o],
					s = e[r];
				"function" == typeof s && (n[r] = x(s, t))
			}
			return n
		}

		function D() {
			for (var e = arguments.length, t = Array(e), i = 0; i < e; i++) t[i] = arguments[i];
			return 0 === t.length ? function(e) {
				return e
			} : 1 === t.length ? t[0] : t.reduce(function(e, t) {
				return function() {
					return e(t.apply(void 0, arguments))
				}
			})
		}
		var j = Object.assign || function(e) {
			for (var t = 1; t < arguments.length; t++) {
				var i = arguments[t];
				for (var n in i) Object.prototype.hasOwnProperty.call(i, n) && (e[n] = i[n])
			}
			return e
		};

		function M() {
			for (var e = arguments.length, t = Array(e), i = 0; i < e; i++) t[i] = arguments[i];
			return function(e) {
				return function(i, n, o) {
					var r, s = e(i, n, o),
						a = s.dispatch,
						c = {
							getState: s.getState,
							dispatch: function(e) {
								return a(e)
							}
						};
					return r = t.map(function(e) {
						return e(c)
					}), a = D.apply(void 0, r)(s.dispatch), j({}, s, {
						dispatch: a
					})
				}
			}
		}
		i.d(t, "createStore", function() {
			return k
		}), i.d(t, "combineReducers", function() {
			return L
		}), i.d(t, "bindActionCreators", function() {
			return P
		}), i.d(t, "applyMiddleware", function() {
			return M
		}), i.d(t, "compose", function() {
			return D
		})
	}, function(e, t, i) {
		"use strict";

		function n(e) {
			var t, i = e.Symbol;
			return "function" == typeof i ? i.observable ? t = i.observable : (t = i("observable"), i.observable = t) : t = "@@observable", t
		}
		i.d(t, "a", function() {
			return n
		})
	}, function(e, t, i) {
		"use strict";
		(function(e) {
			var i = "object" == typeof e && e && e.Object === Object && e;
			t.a = i
		}).call(this, i(3))
	}, function(e, t, i) {
		e.exports = i(10)
	}, function(e, t, i) {
		"use strict";
		var n = v(i(11)),
			o = v(i(12)),
			r = v(i(13)),
			s = i(20),
			a = i(1),
			c = i(5),
			l = i(28),
			u = i(29),
			h = i(30),
			d = i(31),
			f = i(32),
			p = i(0);

		function v(e) {
			return e && e.__esModule ? e : {
				default: e
			}
		}

		function m(e, t, i) {
			return t in e ? Object.defineProperty(e, t, {
				value: i,
				enumerable: !0,
				configurable: !0,
				writable: !0
			}) : e[t] = i, e
		}

		function g(e, t) {
			for (var i = 0; i < t.length; i++) {
				var n = t[i];
				n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
			}
		}
		var _ = function() {
			function e() {
				var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "[data-choice]",
					i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
				if (function(e, t) {
						if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
					}(this, e), (0, p.isType)("String", t)) {
					var n = Array.from(document.querySelectorAll(t));
					if (n.length > 1) return this._generateInstances(n, i)
				}
				this.config = o.default.all([a.DEFAULT_CONFIG, e.userDefaults, i], {
					arrayMerge: function(e, t) {
						return [].concat(t)
					}
				});
				var c = (0, p.diff)(this.config, a.DEFAULT_CONFIG);
				c.length && console.warn("Unknown config option(s) passed", c.join(", ")), ["auto", "always"].includes(this.config.renderSelectedChoices) || (this.config.renderSelectedChoices = "auto");
				var l = (0, p.isType)("String", t) ? document.querySelector(t) : t;
				return l ? (this._isTextElement = "text" === l.type, this._isSelectOneElement = "select-one" === l.type, this._isSelectMultipleElement = "select-multiple" === l.type, this._isSelectElement = this._isSelectOneElement || this._isSelectMultipleElement, this._isTextElement ? this.passedElement = new s.WrappedInput({
					element: l,
					classNames: this.config.classNames,
					delimiter: this.config.delimiter
				}) : this._isSelectElement && (this.passedElement = new s.WrappedSelect({
					element: l,
					classNames: this.config.classNames
				})), this.passedElement ? (!0 === this.config.shouldSortItems && this._isSelectOneElement && !this.config.silent && console.warn("shouldSortElements: Type of passed element is 'select-one', falling back to false."), this.initialised = !1, this._store = new r.default(this.render), this._initialState = {}, this._currentState = {}, this._prevState = {}, this._currentValue = "", this._canSearch = this.config.searchEnabled, this._isScrollingOnIe = !1, this._highlightPosition = 0, this._wasTap = !0, this._placeholderValue = this._generatePlaceholderValue(), this._baseId = (0, p.generateId)(this.passedElement.element, "choices-"), this._direction = this.passedElement.element.getAttribute("dir") || "ltr", this._idNames = {
					itemChoice: "item-choice"
				}, this._presetChoices = this.config.choices, this._presetItems = this.config.items, this.passedElement.value && (this._presetItems = this._presetItems.concat(this.passedElement.value.split(this.config.delimiter))), this._render = this._render.bind(this), this._onFocus = this._onFocus.bind(this), this._onBlur = this._onBlur.bind(this), this._onKeyUp = this._onKeyUp.bind(this), this._onKeyDown = this._onKeyDown.bind(this), this._onClick = this._onClick.bind(this), this._onTouchMove = this._onTouchMove.bind(this), this._onTouchEnd = this._onTouchEnd.bind(this), this._onMouseDown = this._onMouseDown.bind(this), this._onMouseOver = this._onMouseOver.bind(this), this._onFormReset = this._onFormReset.bind(this), this._onAKey = this._onAKey.bind(this), this._onEnterKey = this._onEnterKey.bind(this), this._onEscapeKey = this._onEscapeKey.bind(this), this._onDirectionKey = this._onDirectionKey.bind(this), this._onDeleteKey = this._onDeleteKey.bind(this), "active" === this.passedElement.element.getAttribute("data-choice") && console.warn("Trying to initialise Choices on element already initialised"), void this.init()) : console.error("Passed element was of an invalid type")) : console.error("Could not find passed element or passed element was of an invalid type")
			}
			var t, i, v;
			return t = e, (i = [{
				key: "init",
				value: function() {
					if (!this.initialised) {
						this._createTemplates(), this._createElements(), this._createStructure(), this._initialState = (0, p.cloneObject)(this._store.state), this._store.subscribe(this._render), this._render(), this._addEventListeners(), (!this.config.addItems || this.passedElement.element.hasAttribute("disabled")) && this.disable(), this.initialised = !0;
						var e = this.config.callbackOnInit;
						e && (0, p.isType)("Function", e) && e.call(this)
					}
				}
			}, {
				key: "destroy",
				value: function() {
					this.initialised && (this._removeEventListeners(), this.passedElement.reveal(), this.containerOuter.unwrap(this.passedElement.element), this._isSelectElement && (this.passedElement.options = this._presetChoices), this.clearStore(), this.config.templates = null, this.initialised = !1)
				}
			}, {
				key: "enable",
				value: function() {
					return this.passedElement.isDisabled && this.passedElement.enable(), this.containerOuter.isDisabled && (this._addEventListeners(), this.input.enable(), this.containerOuter.enable()), this
				}
			}, {
				key: "disable",
				value: function() {
					return this.passedElement.isDisabled || this.passedElement.disable(), this.containerOuter.isDisabled || (this._removeEventListeners(), this.input.disable(), this.containerOuter.disable()), this
				}
			}, {
				key: "highlightItem",
				value: function(e) {
					var t = !(arguments.length > 1 && void 0 !== arguments[1]) || arguments[1];
					if (!e) return this;
					var i = e.id,
						n = e.groupId,
						o = void 0 === n ? -1 : n,
						r = e.value,
						s = void 0 === r ? "" : r,
						c = e.label,
						l = void 0 === c ? "" : c,
						h = o >= 0 ? this._store.getGroupById(o) : null;
					return this._store.dispatch((0, u.highlightItem)(i, !0)), t && this.passedElement.triggerEvent(a.EVENTS.highlightItem, {
						id: i,
						value: s,
						label: l,
						groupValue: h && h.value ? h.value : null
					}), this
				}
			}, {
				key: "unhighlightItem",
				value: function(e) {
					if (!e) return this;
					var t = e.id,
						i = e.groupId,
						n = void 0 === i ? -1 : i,
						o = e.value,
						r = void 0 === o ? "" : o,
						s = e.label,
						c = void 0 === s ? "" : s,
						l = n >= 0 ? this._store.getGroupById(n) : null;
					return this._store.dispatch((0, u.highlightItem)(t, !1)), this.passedElement.triggerEvent(a.EVENTS.highlightItem, {
						id: t,
						value: r,
						label: c,
						groupValue: l && l.value ? l.value : null
					}), this
				}
			}, {
				key: "highlightAll",
				value: function() {
					var e = this;
					return this._store.items.forEach(function(t) {
						return e.highlightItem(t)
					}), this
				}
			}, {
				key: "unhighlightAll",
				value: function() {
					var e = this;
					return this._store.items.forEach(function(t) {
						return e.unhighlightItem(t)
					}), this
				}
			}, {
				key: "removeActiveItemsByValue",
				value: function(e) {
					var t = this;
					return this._store.activeItems.filter(function(t) {
						return t.value === e
					}).forEach(function(e) {
						return t._removeItem(e)
					}), this
				}
			}, {
				key: "removeActiveItems",
				value: function(e) {
					var t = this;
					return this._store.activeItems.filter(function(t) {
						return t.id !== e
					}).forEach(function(e) {
						return t._removeItem(e)
					}), this
				}
			}, {
				key: "removeHighlightedItems",
				value: function() {
					var e = this,
						t = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
					return this._store.highlightedActiveItems.forEach(function(i) {
						e._removeItem(i), t && e._triggerChange(i.value)
					}), this
				}
			}, {
				key: "showDropdown",
				value: function(e) {
					var t = this;
					return this.dropdown.isActive ? this : (requestAnimationFrame(function() {
						t.dropdown.show(), t.containerOuter.open(t.dropdown.distanceFromTopWindow()), !e && t._canSearch && t.input.focus(), t.passedElement.triggerEvent(a.EVENTS.showDropdown, {})
					}), this)
				}
			}, {
				key: "hideDropdown",
				value: function(e) {
					var t = this;
					return this.dropdown.isActive ? (requestAnimationFrame(function() {
						t.dropdown.hide(), t.containerOuter.close(), !e && t._canSearch && (t.input.removeActiveDescendant(), t.input.blur()), t.passedElement.triggerEvent(a.EVENTS.hideDropdown, {})
					}), this) : this
				}
			}, {
				key: "getValue",
				value: function() {
					var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0],
						t = this._store.activeItems.reduce(function(t, i) {
							var n = e ? i.value : i;
							return t.push(n), t
						}, []);
					return this._isSelectOneElement ? t[0] : t
				}
			}, {
				key: "setValue",
				value: function(e) {
					var t = this;
					return this.initialised ? ([].concat(e).forEach(function(e) {
						return t._setChoiceOrItem(e)
					}), this) : this
				}
			}, {
				key: "setChoiceByValue",
				value: function(e) {
					var t = this;
					return !this.initialised || this._isTextElement ? this : (((0, p.isType)("Array", e) ? e : [e]).forEach(function(e) {
						return t._findAndSelectChoiceByValue(e)
					}), this)
				}
			}, {
				key: "setChoices",
				value: function() {
					var e = this,
						t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
						i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "",
						n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "",
						o = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
					if (!this._isSelectElement || !i) return this;
					o && this.clearChoices(), this.containerOuter.removeLoadingState();
					return this._setLoading(!0), t.forEach(function(t) {
						t.choices ? e._addGroup({
							group: t,
							id: t.id || null,
							valueKey: i,
							labelKey: n
						}) : e._addChoice({
							value: t[i],
							label: t[n],
							isSelected: t.selected,
							isDisabled: t.disabled,
							customProperties: t.customProperties,
							placeholder: t.placeholder
						})
					}), this._setLoading(!1), this
				}
			}, {
				key: "clearChoices",
				value: function() {
					this._store.dispatch((0, l.clearChoices)())
				}
			}, {
				key: "clearStore",
				value: function() {
					return this._store.dispatch((0, d.clearAll)()), this
				}
			}, {
				key: "clearInput",
				value: function() {
					var e = !this._isSelectOneElement;
					return this.input.clear(e), !this._isTextElement && this._canSearch && (this._isSearching = !1, this._store.dispatch((0, l.activateChoices)(!0))), this
				}
			}, {
				key: "ajax",
				value: function(e) {
					var t = this;
					return this.initialised && this._isSelectElement && e ? (requestAnimationFrame(function() {
						return t._handleLoadingState(!0)
					}), e(this._ajaxCallback()), this) : this
				}
			}, {
				key: "_render",
				value: function() {
					if (!this._store.isLoading()) {
						this._currentState = this._store.state;
						var e = this._currentState.choices !== this._prevState.choices || this._currentState.groups !== this._prevState.groups || this._currentState.items !== this._prevState.items,
							t = this._isSelectElement,
							i = this._currentState.items !== this._prevState.items;
						e && (t && this._renderChoices(), i && this._renderItems(), this._prevState = this._currentState)
					}
				}
			}, {
				key: "_renderChoices",
				value: function() {
					var e = this,
						t = this._store,
						i = t.activeGroups,
						n = t.activeChoices,
						o = document.createDocumentFragment();
					if (this.choiceList.clear(), this.config.resetScrollPosition && requestAnimationFrame(function() {
							return e.choiceList.scrollToTop()
						}), i.length >= 1 && !this._isSearching) {
						var r = n.filter(function(e) {
							return !0 === e.placeholder && -1 === e.groupId
						});
						r.length >= 1 && (o = this._createChoicesFragment(r, o)), o = this._createGroupsFragment(i, n, o)
					} else n.length >= 1 && (o = this._createChoicesFragment(n, o));
					if (o.childNodes && o.childNodes.length > 0) {
						var s = this._store.activeItems,
							a = this._canAddItem(s, this.input.value);
						a.response ? (this.choiceList.append(o), this._highlightChoice()) : this.choiceList.append(this._getTemplate("notice", a.notice))
					} else {
						var c, l;
						this._isSearching ? (l = (0, p.isType)("Function", this.config.noResultsText) ? this.config.noResultsText() : this.config.noResultsText, c = this._getTemplate("notice", l, "no-results")) : (l = (0, p.isType)("Function", this.config.noChoicesText) ? this.config.noChoicesText() : this.config.noChoicesText, c = this._getTemplate("notice", l, "no-choices")), this.choiceList.append(c)
					}
				}
			}, {
				key: "_renderItems",
				value: function() {
					var e = this._store.activeItems || [];
					this.itemList.clear();
					var t = this._createItemsFragment(e);
					t.childNodes && this.itemList.append(t)
				}
			}, {
				key: "_createGroupsFragment",
				value: function(e, t, i) {
					var n = this,
						o = i || document.createDocumentFragment();
					return this.config.shouldSort && e.sort(this.config.sortFn), e.forEach(function(e) {
						var i = function(e) {
							return t.filter(function(t) {
								return n._isSelectOneElement ? t.groupId === e.id : t.groupId === e.id && ("always" === n.config.renderSelectedChoices || !t.selected)
							})
						}(e);
						if (i.length >= 1) {
							var r = n._getTemplate("choiceGroup", e);
							o.appendChild(r), n._createChoicesFragment(i, o, !0)
						}
					}), o
				}
			}, {
				key: "_createChoicesFragment",
				value: function(e, t) {
					var i = this,
						n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
						o = t || document.createDocumentFragment(),
						r = this.config,
						s = r.renderSelectedChoices,
						a = r.searchResultLimit,
						c = r.renderChoiceLimit,
						l = this._isSearching ? p.sortByScore : this.config.sortFn,
						u = function(e) {
							if ("auto" !== s || (i._isSelectOneElement || !e.selected)) {
								var t = i._getTemplate("choice", e, i.config.itemSelectText);
								o.appendChild(t)
							}
						},
						h = e;
					"auto" !== s || this._isSelectOneElement || (h = e.filter(function(e) {
						return !e.selected
					}));
					var d = h.reduce(function(e, t) {
							return t.placeholder ? e.placeholderChoices.push(t) : e.normalChoices.push(t), e
						}, {
							placeholderChoices: [],
							normalChoices: []
						}),
						f = d.placeholderChoices,
						v = d.normalChoices;
					(this.config.shouldSort || this._isSearching) && v.sort(l);
					var m = h.length,
						g = [].concat(f, v);
					this._isSearching ? m = a : c > 0 && !n && (m = c);
					for (var _ = 0; _ < m; _ += 1) g[_] && u(g[_]);
					return o
				}
			}, {
				key: "_createItemsFragment",
				value: function(e) {
					var t = this,
						i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null,
						n = this.config,
						o = n.shouldSortItems,
						r = n.sortFn,
						s = n.removeItemButton,
						a = i || document.createDocumentFragment();
					o && !this._isSelectOneElement && e.sort(r), this._isTextElement ? this.passedElement.value = e : this.passedElement.options = e;
					return e.forEach(function(e) {
						return function(e) {
							var i = t._getTemplate("item", e, s);
							a.appendChild(i)
						}(e)
					}), a
				}
			}, {
				key: "_triggerChange",
				value: function(e) {
					null != e && this.passedElement.triggerEvent(a.EVENTS.change, {
						value: e
					})
				}
			}, {
				key: "_selectPlaceholderChoice",
				value: function() {
					var e = this._store.placeholderChoice;
					e && (this._addItem({
						value: e.value,
						label: e.label,
						choiceId: e.id,
						groupId: e.groupId,
						placeholder: e.placeholder
					}), this._triggerChange(e.value))
				}
			}, {
				key: "_handleButtonAction",
				value: function(e, t) {
					if (e && t && this.config.removeItems && this.config.removeItemButton) {
						var i = t.parentNode.getAttribute("data-id"),
							n = e.find(function(e) {
								return e.id === parseInt(i, 10)
							});
						this._removeItem(n), this._triggerChange(n.value), this._isSelectOneElement && this._selectPlaceholderChoice()
					}
				}
			}, {
				key: "_handleItemAction",
				value: function(e, t) {
					var i = this,
						n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
					if (e && t && this.config.removeItems && !this._isSelectOneElement) {
						var o = t.getAttribute("data-id");
						e.forEach(function(e) {
							e.id !== parseInt(o, 10) || e.highlighted ? !n && e.highlighted && i.unhighlightItem(e) : i.highlightItem(e)
						}), this.input.focus()
					}
				}
			}, {
				key: "_handleChoiceAction",
				value: function(e, t) {
					if (e && t) {
						var i = t.getAttribute("data-id"),
							n = this._store.getChoiceById(i),
							o = e[0] && e[0].keyCode ? e[0].keyCode : null,
							r = this.dropdown.isActive;
						if (n.keyCode = o, this.passedElement.triggerEvent(a.EVENTS.choice, {
								choice: n
							}), n && !n.selected && !n.disabled) this._canAddItem(e, n.value).response && (this._addItem({
							value: n.value,
							label: n.label,
							choiceId: n.id,
							groupId: n.groupId,
							customProperties: n.customProperties,
							placeholder: n.placeholder,
							keyCode: n.keyCode
						}), this._triggerChange(n.value));
						this.clearInput(), r && this._isSelectOneElement && (this.hideDropdown(!0), this.containerOuter.focus())
					}
				}
			}, {
				key: "_handleBackspace",
				value: function(e) {
					if (this.config.removeItems && e) {
						var t = e[e.length - 1],
							i = e.some(function(e) {
								return e.highlighted
							});
						this.config.editItems && !i && t ? (this.input.value = t.value, this.input.setWidth(), this._removeItem(t), this._triggerChange(t.value)) : (i || this.highlightItem(t, !1), this.removeHighlightedItems(!0))
					}
				}
			}, {
				key: "_setLoading",
				value: function(e) {
					this._store.dispatch((0, f.setIsLoading)(e))
				}
			}, {
				key: "_handleLoadingState",
				value: function() {
					var e = !(arguments.length > 0 && void 0 !== arguments[0]) || arguments[0],
						t = this.itemList.getChild(".".concat(this.config.classNames.placeholder));
					e ? (this.disable(), this.containerOuter.addLoadingState(), this._isSelectOneElement ? t ? t.innerHTML = this.config.loadingText : (t = this._getTemplate("placeholder", this.config.loadingText), this.itemList.append(t)) : this.input.placeholder = this.config.loadingText) : (this.enable(), this.containerOuter.removeLoadingState(), this._isSelectOneElement ? t.innerHTML = this._placeholderValue || "" : this.input.placeholder = this._placeholderValue || "")
				}
			}, {
				key: "_handleSearch",
				value: function(e) {
					if (e && this.input.isFocussed) {
						var t = this._store.choices,
							i = this.config,
							n = i.searchFloor,
							o = i.searchChoices,
							r = t.some(function(e) {
								return !e.active
							});
						if (e && e.length >= n) {
							var s = o ? this._searchChoices(e) : 0;
							this.passedElement.triggerEvent(a.EVENTS.search, {
								value: e,
								resultCount: s
							})
						} else r && (this._isSearching = !1, this._store.dispatch((0, l.activateChoices)(!0)))
					}
				}
			}, {
				key: "_canAddItem",
				value: function(e, t) {
					var i = !0,
						n = (0, p.isType)("Function", this.config.addItemText) ? this.config.addItemText(t) : this.config.addItemText;
					if (!this._isSelectOneElement) {
						var o = (0, p.existsInArray)(e, t);
						this.config.maxItemCount > 0 && this.config.maxItemCount <= e.length && (i = !1, n = (0, p.isType)("Function", this.config.maxItemText) ? this.config.maxItemText(this.config.maxItemCount) : this.config.maxItemText), !this.config.duplicateItemsAllowed && o && i && (i = !1, n = (0, p.isType)("Function", this.config.uniqueItemText) ? this.config.uniqueItemText(t) : this.config.uniqueItemText), this._isTextElement && this.config.addItems && i && (0, p.isType)("Function", this.config.addItemFilterFn) && !this.config.addItemFilterFn(t) && (i = !1, n = (0, p.isType)("Function", this.config.customAddItemText) ? this.config.customAddItemText(t) : this.config.customAddItemText)
					}
					return {
						response: i,
						notice: n
					}
				}
			}, {
				key: "_ajaxCallback",
				value: function() {
					var e = this;
					return function(t, i, n) {
						if (t && i) {
							var o = (0, p.isType)("Object", t) ? [t] : t;
							o && (0, p.isType)("Array", o) && o.length ? (e._handleLoadingState(!1), e._setLoading(!0), o.forEach(function(t) {
								t.choices ? e._addGroup({
									group: t,
									id: t.id || null,
									valueKey: i,
									labelKey: n
								}) : e._addChoice({
									value: (0, p.fetchFromObject)(t, i),
									label: (0, p.fetchFromObject)(t, n),
									isSelected: t.selected,
									isDisabled: t.disabled,
									customProperties: t.customProperties,
									placeholder: t.placeholder
								})
							}), e._setLoading(!1), e._isSelectOneElement && e._selectPlaceholderChoice()) : e._handleLoadingState(!1)
						}
					}
				}
			}, {
				key: "_searchChoices",
				value: function(e) {
					var t = (0, p.isType)("String", e) ? e.trim() : e,
						i = (0, p.isType)("String", this._currentValue) ? this._currentValue.trim() : this._currentValue;
					if (t.length < 1 && t === "".concat(i, " ")) return 0;
					var o = this._store.searchableChoices,
						r = t,
						s = [].concat(this.config.searchFields),
						a = Object.assign(this.config.fuseOptions, {
							keys: s
						}),
						c = new n.default(o, a).search(r);
					return this._currentValue = t, this._highlightPosition = 0, this._isSearching = !0, this._store.dispatch((0, l.filterChoices)(c)), c.length
				}
			}, {
				key: "_addEventListeners",
				value: function() {
					document.addEventListener("keyup", this._onKeyUp), document.addEventListener("keydown", this._onKeyDown), document.addEventListener("click", this._onClick), document.addEventListener("touchmove", this._onTouchMove), document.addEventListener("touchend", this._onTouchEnd), document.addEventListener("mousedown", this._onMouseDown), document.addEventListener("mouseover", this._onMouseOver), this._isSelectOneElement && (this.containerOuter.element.addEventListener("focus", this._onFocus), this.containerOuter.element.addEventListener("blur", this._onBlur)), this.input.element.addEventListener("focus", this._onFocus), this.input.element.addEventListener("blur", this._onBlur), this.input.element.form && this.input.element.form.addEventListener("reset", this._onFormReset), this.input.addEventListeners()
				}
			}, {
				key: "_removeEventListeners",
				value: function() {
					document.removeEventListener("keyup", this._onKeyUp), document.removeEventListener("keydown", this._onKeyDown), document.removeEventListener("click", this._onClick), document.removeEventListener("touchmove", this._onTouchMove), document.removeEventListener("touchend", this._onTouchEnd), document.removeEventListener("mousedown", this._onMouseDown), document.removeEventListener("mouseover", this._onMouseOver), this._isSelectOneElement && (this.containerOuter.element.removeEventListener("focus", this._onFocus), this.containerOuter.element.removeEventListener("blur", this._onBlur)), this.input.element.removeEventListener("focus", this._onFocus), this.input.element.removeEventListener("blur", this._onBlur), this.input.element.form && this.input.element.form.removeEventListener("reset", this._onFormReset), this.input.removeEventListeners()
				}
			}, {
				key: "_onKeyDown",
				value: function(e) {
					var t, i = e.target,
						n = e.keyCode,
						o = e.ctrlKey,
						r = e.metaKey;
					if (i === this.input.element || this.containerOuter.element.contains(i)) {
						var s = this._store.activeItems,
							c = this.input.isFocussed,
							l = this.dropdown.isActive,
							u = this.itemList.hasChildren,
							h = String.fromCharCode(n),
							d = a.KEY_CODES.BACK_KEY,
							f = a.KEY_CODES.DELETE_KEY,
							p = a.KEY_CODES.ENTER_KEY,
							v = a.KEY_CODES.A_KEY,
							g = a.KEY_CODES.ESC_KEY,
							_ = a.KEY_CODES.UP_KEY,
							y = a.KEY_CODES.DOWN_KEY,
							b = a.KEY_CODES.PAGE_UP_KEY,
							E = a.KEY_CODES.PAGE_DOWN_KEY,
							S = o || r;
						!this._isTextElement && /[a-zA-Z0-9-_ ]/.test(h) && this.showDropdown();
						var I = (m(t = {}, v, this._onAKey), m(t, p, this._onEnterKey), m(t, g, this._onEscapeKey), m(t, _, this._onDirectionKey), m(t, b, this._onDirectionKey), m(t, y, this._onDirectionKey), m(t, E, this._onDirectionKey), m(t, f, this._onDeleteKey), m(t, d, this._onDeleteKey), t);
						I[n] && I[n]({
							event: e,
							target: i,
							keyCode: n,
							metaKey: r,
							activeItems: s,
							hasFocusedInput: c,
							hasActiveDropdown: l,
							hasItems: u,
							hasCtrlDownKeyPressed: S
						})
					}
				}
			}, {
				key: "_onKeyUp",
				value: function(e) {
					var t = e.target,
						i = e.keyCode;
					if (t === this.input.element) {
						var n = this.input.value,
							o = this._store.activeItems,
							r = this._canAddItem(o, n),
							s = a.KEY_CODES.BACK_KEY,
							c = a.KEY_CODES.DELETE_KEY;
						if (this._isTextElement) {
							if (r.notice && n) {
								var u = this._getTemplate("notice", r.notice);
								this.dropdown.element.innerHTML = u.outerHTML, this.showDropdown(!0)
							} else this.hideDropdown(!0)
						} else {
							var h = (i === s || i === c) && !t.value,
								d = !this._isTextElement && this._isSearching,
								f = this._canSearch && r.response;
							h && d ? (this._isSearching = !1, this._store.dispatch((0, l.activateChoices)(!0))) : f && this._handleSearch(this.input.value)
						}
						this._canSearch = this.config.searchEnabled
					}
				}
			}, {
				key: "_onAKey",
				value: function(e) {
					var t = e.hasItems;
					e.hasCtrlDownKeyPressed && t && (this._canSearch = !1, this.config.removeItems && !this.input.value && this.input.element === document.activeElement && this.highlightAll())
				}
			}, {
				key: "_onEnterKey",
				value: function(e) {
					var t = e.event,
						i = e.target,
						n = e.activeItems,
						o = e.hasActiveDropdown,
						r = a.KEY_CODES.ENTER_KEY,
						s = i.hasAttribute("data-button");
					if (this._isTextElement && i.value) {
						var c = this.input.value;
						this._canAddItem(n, c).response && (this.hideDropdown(!0), this._addItem({
							value: c
						}), this._triggerChange(c), this.clearInput())
					}
					if (s && (this._handleButtonAction(n, i), t.preventDefault()), o) {
						var l = this.dropdown.getChild(".".concat(this.config.classNames.highlightedState));
						l && (n[0] && (n[0].keyCode = r), this._handleChoiceAction(n, l)), t.preventDefault()
					} else this._isSelectOneElement && (this.showDropdown(), t.preventDefault())
				}
			}, {
				key: "_onEscapeKey",
				value: function(e) {
					e.hasActiveDropdown && (this.hideDropdown(!0), this.containerOuter.focus())
				}
			}, {
				key: "_onDirectionKey",
				value: function(e) {
					var t = e.event,
						i = e.hasActiveDropdown,
						n = e.keyCode,
						o = e.metaKey,
						r = a.KEY_CODES.DOWN_KEY,
						s = a.KEY_CODES.PAGE_UP_KEY,
						c = a.KEY_CODES.PAGE_DOWN_KEY;
					if (i || this._isSelectOneElement) {
						this.showDropdown(), this._canSearch = !1;
						var l, u = n === r || n === c ? 1 : -1;
						if (o || n === c || n === s) l = u > 0 ? Array.from(this.dropdown.element.querySelectorAll("[data-choice-selectable]")).pop() : this.dropdown.element.querySelector("[data-choice-selectable]");
						else {
							var h = this.dropdown.element.querySelector(".".concat(this.config.classNames.highlightedState));
							l = h ? (0, p.getAdjacentEl)(h, "[data-choice-selectable]", u) : this.dropdown.element.querySelector("[data-choice-selectable]")
						}
						l && ((0, p.isScrolledIntoView)(l, this.choiceList.element, u) || this.choiceList.scrollToChoice(l, u), this._highlightChoice(l)), t.preventDefault()
					}
				}
			}, {
				key: "_onDeleteKey",
				value: function(e) {
					var t = e.event,
						i = e.target,
						n = e.hasFocusedInput,
						o = e.activeItems;
					!n || i.value || this._isSelectOneElement || (this._handleBackspace(o), t.preventDefault())
				}
			}, {
				key: "_onTouchMove",
				value: function() {
					this._wasTap && (this._wasTap = !1)
				}
			}, {
				key: "_onTouchEnd",
				value: function(e) {
					var t = (e || e.touches[0]).target;
					this._wasTap && this.containerOuter.element.contains(t) && ((t === this.containerOuter.element || t === this.containerInner.element) && (this._isTextElement ? this.input.focus() : this._isSelectMultipleElement && this.showDropdown()), e.stopPropagation());
					this._wasTap = !0
				}
			}, {
				key: "_onMouseDown",
				value: function(e) {
					var t = e.target,
						i = e.shiftKey;
					if (this.choiceList.element.contains(t) && (0, p.isIE11)() && (this._isScrollingOnIe = !0), this.containerOuter.element.contains(t) && t !== this.input.element) {
						var n = this._store.activeItems,
							o = i,
							r = (0, p.findAncestorByAttrName)(t, "data-button"),
							s = (0, p.findAncestorByAttrName)(t, "data-item"),
							a = (0, p.findAncestorByAttrName)(t, "data-choice");
						r ? this._handleButtonAction(n, r) : s ? this._handleItemAction(n, s, o) : a && this._handleChoiceAction(n, a), e.preventDefault()
					}
				}
			}, {
				key: "_onMouseOver",
				value: function(e) {
					var t = e.target;
					(t === this.dropdown || this.dropdown.element.contains(t)) && t.hasAttribute("data-choice") && this._highlightChoice(t)
				}
			}, {
				key: "_onClick",
				value: function(e) {
					var t = e.target;
					this.containerOuter.element.contains(t) ? this.dropdown.isActive || this.containerOuter.isDisabled ? this._isSelectOneElement && t !== this.input.element && !this.dropdown.element.contains(t) && this.hideDropdown() : this._isTextElement ? document.activeElement !== this.input.element && this.input.focus() : (this.showDropdown(), this.containerOuter.focus()) : (this._store.highlightedActiveItems && this.unhighlightAll(), this.containerOuter.removeFocusState(), this.hideDropdown(!0))
				}
			}, {
				key: "_onFocus",
				value: function(e) {
					var t = this,
						i = e.target;
					this.containerOuter.element.contains(i) && {
						text: function() {
							i === t.input.element && t.containerOuter.addFocusState()
						},
						"select-one": function() {
							t.containerOuter.addFocusState(), i === t.input.element && t.showDropdown(!0)
						},
						"select-multiple": function() {
							i === t.input.element && (t.showDropdown(!0), t.containerOuter.addFocusState())
						}
					} [this.passedElement.element.type]()
				}
			}, {
				key: "_onBlur",
				value: function(e) {
					var t = this,
						i = e.target;
					if (this.containerOuter.element.contains(i) && !this._isScrollingOnIe) {
						var n = this._store.activeItems.some(function(e) {
							return e.highlighted
						});
						({
							text: function() {
								i === t.input.element && (t.containerOuter.removeFocusState(), n && t.unhighlightAll(), t.hideDropdown(!0))
							},
							"select-one": function() {
								t.containerOuter.removeFocusState(), (i === t.input.element || i === t.containerOuter.element && !t._canSearch) && t.hideDropdown(!0)
							},
							"select-multiple": function() {
								i === t.input.element && (t.containerOuter.removeFocusState(), t.hideDropdown(!0), n && t.unhighlightAll())
							}
						})[this.passedElement.element.type]()
					} else this._isScrollingOnIe = !1, this.input.element.focus()
				}
			}, {
				key: "_onFormReset",
				value: function() {
					this._store.dispatch((0, d.resetTo)(this._initialState))
				}
			}, {
				key: "_highlightChoice",
				value: function() {
					var e = this,
						t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : null,
						i = Array.from(this.dropdown.element.querySelectorAll("[data-choice-selectable]"));
					if (i.length) {
						var n = t;
						Array.from(this.dropdown.element.querySelectorAll(".".concat(this.config.classNames.highlightedState))).forEach(function(t) {
							t.classList.remove(e.config.classNames.highlightedState), t.setAttribute("aria-selected", "false")
						}), n ? this._highlightPosition = i.indexOf(n) : (n = i.length > this._highlightPosition ? i[this._highlightPosition] : i[i.length - 1]) || (n = i[0]), n.classList.add(this.config.classNames.highlightedState), n.setAttribute("aria-selected", "true"), this.passedElement.triggerEvent(a.EVENTS.highlightChoice, {
							el: n
						}), this.dropdown.isActive && (this.input.setActiveDescendant(n.id), this.containerOuter.setActiveDescendant(n.id))
					}
				}
			}, {
				key: "_addItem",
				value: function(e) {
					var t = e.value,
						i = e.label,
						n = void 0 === i ? null : i,
						o = e.choiceId,
						r = void 0 === o ? -1 : o,
						s = e.groupId,
						c = void 0 === s ? -1 : s,
						l = e.customProperties,
						h = void 0 === l ? null : l,
						d = e.placeholder,
						f = void 0 !== d && d,
						v = e.keyCode,
						m = void 0 === v ? null : v,
						g = (0, p.isType)("String", t) ? t.trim() : t,
						_ = m,
						y = h,
						b = this._store.items,
						E = n || g,
						S = parseInt(r, 10) || -1,
						I = c >= 0 ? this._store.getGroupById(c) : null,
						O = b ? b.length + 1 : 1;
					return this.config.prependValue && (g = this.config.prependValue + g.toString()), this.config.appendValue && (g += this.config.appendValue.toString()), this._store.dispatch((0, u.addItem)({
						value: g,
						label: E,
						id: O,
						choiceId: S,
						groupId: c,
						customProperties: h,
						placeholder: f,
						keyCode: _
					})), this._isSelectOneElement && this.removeActiveItems(O), this.passedElement.triggerEvent(a.EVENTS.addItem, {
						id: O,
						value: g,
						label: E,
						customProperties: y,
						groupValue: I && I.value ? I.value : void 0,
						keyCode: _
					}), this
				}
			}, {
				key: "_removeItem",
				value: function(e) {
					if (!e || !(0, p.isType)("Object", e)) return this;
					var t = e.id,
						i = e.value,
						n = e.label,
						o = e.choiceId,
						r = e.groupId,
						s = r >= 0 ? this._store.getGroupById(r) : null;
					return this._store.dispatch((0, u.removeItem)(t, o)), s && s.value ? this.passedElement.triggerEvent(a.EVENTS.removeItem, {
						id: t,
						value: i,
						label: n,
						groupValue: s.value
					}) : this.passedElement.triggerEvent(a.EVENTS.removeItem, {
						id: t,
						value: i,
						label: n
					}), this
				}
			}, {
				key: "_addChoice",
				value: function(e) {
					var t = e.value,
						i = e.label,
						n = void 0 === i ? null : i,
						o = e.isSelected,
						r = void 0 !== o && o,
						s = e.isDisabled,
						a = void 0 !== s && s,
						c = e.groupId,
						u = void 0 === c ? -1 : c,
						h = e.customProperties,
						d = void 0 === h ? null : h,
						f = e.placeholder,
						p = void 0 !== f && f,
						v = e.keyCode,
						m = void 0 === v ? null : v;
					if (null != t) {
						var g = this._store.choices,
							_ = n || t,
							y = g ? g.length + 1 : 1,
							b = "".concat(this._baseId, "-").concat(this._idNames.itemChoice, "-").concat(y);
						this._store.dispatch((0, l.addChoice)({
							value: t,
							label: _,
							id: y,
							groupId: u,
							disabled: a,
							elementId: b,
							customProperties: d,
							placeholder: p,
							keyCode: m
						})), r && this._addItem({
							value: t,
							label: _,
							choiceId: y,
							customProperties: d,
							placeholder: p,
							keyCode: m
						})
					}
				}
			}, {
				key: "_addGroup",
				value: function(e) {
					var t = this,
						i = e.group,
						n = e.id,
						o = e.valueKey,
						r = void 0 === o ? "value" : o,
						s = e.labelKey,
						a = void 0 === s ? "label" : s,
						c = (0, p.isType)("Object", i) ? i.choices : Array.from(i.getElementsByTagName("OPTION")),
						l = n || Math.floor((new Date).valueOf() * Math.random()),
						u = !!i.disabled && i.disabled;
					if (c) {
						this._store.dispatch((0, h.addGroup)(i.label, l, !0, u));
						c.forEach(function(e) {
							var i = e.disabled || e.parentNode && e.parentNode.disabled;
							t._addChoice({
								value: e[r],
								label: (0, p.isType)("Object", e) ? e[a] : e.innerHTML,
								isSelected: e.selected,
								isDisabled: i,
								groupId: l,
								customProperties: e.customProperties,
								placeholder: e.placeholder
							})
						})
					} else this._store.dispatch((0, h.addGroup)(i.label, i.id, !1, i.disabled))
				}
			}, {
				key: "_getTemplate",
				value: function(e) {
					var t;
					if (!e) return null;
					for (var i = this.config, n = i.templates, o = i.classNames, r = arguments.length, s = new Array(r > 1 ? r - 1 : 0), a = 1; a < r; a++) s[a - 1] = arguments[a];
					return (t = n[e]).call.apply(t, [this, o].concat(s))
				}
			}, {
				key: "_createTemplates",
				value: function() {
					var e = this.config.callbackOnCreateTemplates,
						t = {};
					e && (0, p.isType)("Function", e) && (t = e.call(this, p.strToEl)), this.config.templates = (0, o.default)(c.TEMPLATES, t)
				}
			}, {
				key: "_createElements",
				value: function() {
					this.containerOuter = new s.Container({
						element: this._getTemplate("containerOuter", this._direction, this._isSelectElement, this._isSelectOneElement, this.config.searchEnabled, this.passedElement.element.type),
						classNames: this.config.classNames,
						type: this.passedElement.element.type,
						position: this.config.position
					}), this.containerInner = new s.Container({
						element: this._getTemplate("containerInner"),
						classNames: this.config.classNames,
						type: this.passedElement.element.type,
						position: this.config.position
					}), this.input = new s.Input({
						element: this._getTemplate("input"),
						classNames: this.config.classNames,
						type: this.passedElement.element.type
					}), this.choiceList = new s.List({
						element: this._getTemplate("choiceList", this._isSelectOneElement)
					}), this.itemList = new s.List({
						element: this._getTemplate("itemList", this._isSelectOneElement)
					}), this.dropdown = new s.Dropdown({
						element: this._getTemplate("dropdown"),
						classNames: this.config.classNames,
						type: this.passedElement.element.type
					})
				}
			}, {
				key: "_createStructure",
				value: function() {
					this.passedElement.conceal(), this.containerInner.wrap(this.passedElement.element), this.containerOuter.wrap(this.containerInner.element), this._isSelectOneElement ? this.input.placeholder = this.config.searchPlaceholderValue || "" : this._placeholderValue && (this.input.placeholder = this._placeholderValue, this.input.setWidth(!0)), this.containerOuter.element.appendChild(this.containerInner.element), this.containerOuter.element.appendChild(this.dropdown.element), this.containerInner.element.appendChild(this.itemList.element), this._isTextElement || this.dropdown.element.appendChild(this.choiceList.element), this._isSelectOneElement ? this.config.searchEnabled && this.dropdown.element.insertBefore(this.input.element, this.dropdown.element.firstChild) : this.containerInner.element.appendChild(this.input.element), this._isSelectElement ? this._addPredefinedChoices() : this._isTextElement && this._addPredefinedItems()
				}
			}, {
				key: "_addPredefinedChoices",
				value: function() {
					var e = this,
						t = this.passedElement.optionGroups;
					if (this._highlightPosition = 0, this._isSearching = !1, this._setLoading(!0), t && t.length) {
						var i = this.passedElement.placeholderOption;
						i && "SELECT" === i.parentNode.tagName && this._addChoice({
							value: i.value,
							label: i.innerHTML,
							isSelected: i.selected,
							isDisabled: i.disabled,
							placeholder: !0
						}), t.forEach(function(t) {
							return e._addGroup({
								group: t,
								id: t.id || null
							})
						})
					} else {
						var n = this.passedElement.options,
							o = this.config.sortFn,
							r = this._presetChoices;
						n.forEach(function(e) {
							r.push({
								value: e.value,
								label: e.innerHTML,
								selected: e.selected,
								disabled: e.disabled || e.parentNode.disabled,
								placeholder: e.hasAttribute("placeholder"),
								customProperties: e.getAttribute("data-custom-properties")
							})
						}), this.config.shouldSort && r.sort(o);
						var s = r.some(function(e) {
							return e.selected
						});
						r.forEach(function(t, i) {
							return function(t, i) {
								var n = t.value,
									o = t.label,
									r = t.customProperties,
									a = t.placeholder;
								if (e._isSelectElement)
									if (t.choices) e._addGroup({
										group: t,
										id: t.id || null
									});
									else {
										var c = e._isSelectOneElement && !s && 0 === i,
											l = !!c || t.selected,
											u = !c && t.disabled;
										e._addChoice({
											value: n,
											label: o,
											isSelected: l,
											isDisabled: u,
											customProperties: r,
											placeholder: a
										})
									}
								else e._addChoice({
									value: n,
									label: o,
									isSelected: t.selected,
									isDisabled: t.disabled,
									customProperties: r,
									placeholder: a
								})
							}(t, i)
						})
					}
					this._setLoading(!1)
				}
			}, {
				key: "_addPredefinedItems",
				value: function() {
					var e = this;
					this._presetItems.forEach(function(t) {
						return function(t) {
							var i = (0, p.getType)(t);
							"Object" === i && t.value ? e._addItem({
								value: t.value,
								label: t.label,
								choiceId: t.id,
								customProperties: t.customProperties,
								placeholder: t.placeholder
							}) : "String" === i && e._addItem({
								value: t
							})
						}(t)
					})
				}
			}, {
				key: "_setChoiceOrItem",
				value: function(e) {
					var t = this;
					({
						object: function() {
							e.value && (t._isTextElement ? t._addItem({
								value: e.value,
								label: e.label,
								choiceId: e.id,
								customProperties: e.customProperties,
								placeholder: e.placeholder
							}) : t._addChoice({
								value: e.value,
								label: e.label,
								isSelected: !0,
								isDisabled: !1,
								customProperties: e.customProperties,
								placeholder: e.placeholder
							}))
						},
						string: function() {
							t._isTextElement ? t._addItem({
								value: e
							}) : t._addChoice({
								value: e,
								label: e,
								isSelected: !0,
								isDisabled: !1
							})
						}
					})[(0, p.getType)(e).toLowerCase()]()
				}
			}, {
				key: "_findAndSelectChoiceByValue",
				value: function(e) {
					var t = this,
						i = this._store.choices.find(function(i) {
							return t.config.itemComparer(i.value, e)
						});
					i && !i.selected && this._addItem({
						value: i.value,
						label: i.label,
						choiceId: i.id,
						groupId: i.groupId,
						customProperties: i.customProperties,
						placeholder: i.placeholder,
						keyCode: i.keyCode
					})
				}
			}, {
				key: "_generateInstances",
				value: function(t, i) {
					return t.reduce(function(t, n) {
						return t.push(new e(n, i)), t
					}, [this])
				}
			}, {
				key: "_generatePlaceholderValue",
				value: function() {
					return !this._isSelectOneElement && (!!this.config.placeholder && (this.config.placeholderValue || this.passedElement.element.getAttribute("placeholder")))
				}
			}]) && g(t.prototype, i), v && g(t, v), e
		}();
		_.userDefaults = {}, e.exports = _
	}, function(e, t, i) {
		/*!
		 * Fuse.js v3.4.2 - Lightweight fuzzy-search (http://fusejs.io)
		 * 
		 * Copyright (c) 2012-2017 Kirollos Risk (http://kiro.me)
		 * All Rights Reserved. Apache Software License 2.0
		 * 
		 * http://www.apache.org/licenses/LICENSE-2.0
		 */
		var n;
		n = function() {
			return function(e) {
				var t = {};

				function i(n) {
					if (t[n]) return t[n].exports;
					var o = t[n] = {
						i: n,
						l: !1,
						exports: {}
					};
					return e[n].call(o.exports, o, o.exports, i), o.l = !0, o.exports
				}
				return i.m = e, i.c = t, i.d = function(e, t, n) {
					i.o(e, t) || Object.defineProperty(e, t, {
						enumerable: !0,
						get: n
					})
				}, i.r = function(e) {
					"undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
						value: "Module"
					}), Object.defineProperty(e, "__esModule", {
						value: !0
					})
				}, i.t = function(e, t) {
					if (1 & t && (e = i(e)), 8 & t) return e;
					if (4 & t && "object" == typeof e && e && e.__esModule) return e;
					var n = Object.create(null);
					if (i.r(n), Object.defineProperty(n, "default", {
							enumerable: !0,
							value: e
						}), 2 & t && "string" != typeof e)
						for (var o in e) i.d(n, o, function(t) {
							return e[t]
						}.bind(null, o));
					return n
				}, i.n = function(e) {
					var t = e && e.__esModule ? function() {
						return e.default
					} : function() {
						return e
					};
					return i.d(t, "a", t), t
				}, i.o = function(e, t) {
					return Object.prototype.hasOwnProperty.call(e, t)
				}, i.p = "", i(i.s = "./src/index.js")
			}({
				"./src/bitap/bitap_matched_indices.js":
					/*!********************************************!*\
					  !*** ./src/bitap/bitap_matched_indices.js ***!
					  \********************************************/
					/*! no static exports found */
					function(e, t) {
						e.exports = function() {
							for (var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [], t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 1, i = [], n = -1, o = -1, r = 0, s = e.length; r < s; r += 1) {
								var a = e[r];
								a && -1 === n ? n = r : a || -1 === n || ((o = r - 1) - n + 1 >= t && i.push([n, o]), n = -1)
							}
							return e[r - 1] && r - n >= t && i.push([n, r - 1]), i
						}
					},
				"./src/bitap/bitap_pattern_alphabet.js":
					/*!*********************************************!*\
					  !*** ./src/bitap/bitap_pattern_alphabet.js ***!
					  \*********************************************/
					/*! no static exports found */
					function(e, t) {
						e.exports = function(e) {
							for (var t = {}, i = e.length, n = 0; n < i; n += 1) t[e.charAt(n)] = 0;
							for (var o = 0; o < i; o += 1) t[e.charAt(o)] |= 1 << i - o - 1;
							return t
						}
					},
				"./src/bitap/bitap_regex_search.js":
					/*!*****************************************!*\
					  !*** ./src/bitap/bitap_regex_search.js ***!
					  \*****************************************/
					/*! no static exports found */
					function(e, t) {
						var i = /[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g;
						e.exports = function(e, t) {
							var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : / +/g,
								o = new RegExp(t.replace(i, "\\$&").replace(n, "|")),
								r = e.match(o),
								s = !!r,
								a = [];
							if (s)
								for (var c = 0, l = r.length; c < l; c += 1) {
									var u = r[c];
									a.push([e.indexOf(u), u.length - 1])
								}
							return {
								score: s ? .5 : 1,
								isMatch: s,
								matchedIndices: a
							}
						}
					},
				"./src/bitap/bitap_score.js":
					/*!**********************************!*\
					  !*** ./src/bitap/bitap_score.js ***!
					  \**********************************/
					/*! no static exports found */
					function(e, t) {
						e.exports = function(e, t) {
							var i = t.errors,
								n = void 0 === i ? 0 : i,
								o = t.currentLocation,
								r = void 0 === o ? 0 : o,
								s = t.expectedLocation,
								a = void 0 === s ? 0 : s,
								c = t.distance,
								l = void 0 === c ? 100 : c,
								u = n / e.length,
								h = Math.abs(a - r);
							return l ? u + h / l : h ? 1 : u
						}
					},
				"./src/bitap/bitap_search.js":
					/*!***********************************!*\
					  !*** ./src/bitap/bitap_search.js ***!
					  \***********************************/
					/*! no static exports found */
					function(e, t, i) {
						var n = i( /*! ./bitap_score */ "./src/bitap/bitap_score.js"),
							o = i( /*! ./bitap_matched_indices */ "./src/bitap/bitap_matched_indices.js");
						e.exports = function(e, t, i, r) {
							for (var s = r.location, a = void 0 === s ? 0 : s, c = r.distance, l = void 0 === c ? 100 : c, u = r.threshold, h = void 0 === u ? .6 : u, d = r.findAllMatches, f = void 0 !== d && d, p = r.minMatchCharLength, v = void 0 === p ? 1 : p, m = a, g = e.length, _ = h, y = e.indexOf(t, m), b = t.length, E = [], S = 0; S < g; S += 1) E[S] = 0;
							if (-1 !== y) {
								var I = n(t, {
									errors: 0,
									currentLocation: y,
									expectedLocation: m,
									distance: l
								});
								if (_ = Math.min(I, _), -1 !== (y = e.lastIndexOf(t, m + b))) {
									var O = n(t, {
										errors: 0,
										currentLocation: y,
										expectedLocation: m,
										distance: l
									});
									_ = Math.min(O, _)
								}
							}
							y = -1;
							for (var C = [], T = 1, w = b + g, k = 1 << b - 1, A = 0; A < b; A += 1) {
								for (var L = 0, x = w; L < x;) {
									n(t, {
										errors: A,
										currentLocation: m + x,
										expectedLocation: m,
										distance: l
									}) <= _ ? L = x : w = x, x = Math.floor((w - L) / 2 + L)
								}
								w = x;
								var P = Math.max(1, m - x + 1),
									D = f ? g : Math.min(m + x, g) + b,
									j = Array(D + 2);
								j[D + 1] = (1 << A) - 1;
								for (var M = D; M >= P; M -= 1) {
									var N = M - 1,
										F = i[e.charAt(N)];
									if (F && (E[N] = 1), j[M] = (j[M + 1] << 1 | 1) & F, 0 !== A && (j[M] |= (C[M + 1] | C[M]) << 1 | 1 | C[M + 1]), j[M] & k && (T = n(t, {
											errors: A,
											currentLocation: N,
											expectedLocation: m,
											distance: l
										})) <= _) {
										if (_ = T, (y = N) <= m) break;
										P = Math.max(1, 2 * m - y)
									}
								}
								if (n(t, {
										errors: A + 1,
										currentLocation: m,
										expectedLocation: m,
										distance: l
									}) > _) break;
								C = j
							}
							return {
								isMatch: y >= 0,
								score: 0 === T ? .001 : T,
								matchedIndices: o(E, v)
							}
						}
					},
				"./src/bitap/index.js":
					/*!****************************!*\
					  !*** ./src/bitap/index.js ***!
					  \****************************/
					/*! no static exports found */
					function(e, t, i) {
						function n(e, t) {
							for (var i = 0; i < t.length; i++) {
								var n = t[i];
								n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
							}
						}
						var o = i( /*! ./bitap_regex_search */ "./src/bitap/bitap_regex_search.js"),
							r = i( /*! ./bitap_search */ "./src/bitap/bitap_search.js"),
							s = i( /*! ./bitap_pattern_alphabet */ "./src/bitap/bitap_pattern_alphabet.js"),
							a = function() {
								function e(t, i) {
									var n = i.location,
										o = void 0 === n ? 0 : n,
										r = i.distance,
										a = void 0 === r ? 100 : r,
										c = i.threshold,
										l = void 0 === c ? .6 : c,
										u = i.maxPatternLength,
										h = void 0 === u ? 32 : u,
										d = i.isCaseSensitive,
										f = void 0 !== d && d,
										p = i.tokenSeparator,
										v = void 0 === p ? / +/g : p,
										m = i.findAllMatches,
										g = void 0 !== m && m,
										_ = i.minMatchCharLength,
										y = void 0 === _ ? 1 : _;
									! function(e, t) {
										if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
									}(this, e), this.options = {
										location: o,
										distance: a,
										threshold: l,
										maxPatternLength: h,
										isCaseSensitive: f,
										tokenSeparator: v,
										findAllMatches: g,
										minMatchCharLength: y
									}, this.pattern = this.options.isCaseSensitive ? t : t.toLowerCase(), this.pattern.length <= h && (this.patternAlphabet = s(this.pattern))
								}
								var t, i, a;
								return t = e, (i = [{
									key: "search",
									value: function(e) {
										if (this.options.isCaseSensitive || (e = e.toLowerCase()), this.pattern === e) return {
											isMatch: !0,
											score: 0,
											matchedIndices: [
												[0, e.length - 1]
											]
										};
										var t = this.options,
											i = t.maxPatternLength,
											n = t.tokenSeparator;
										if (this.pattern.length > i) return o(e, this.pattern, n);
										var s = this.options,
											a = s.location,
											c = s.distance,
											l = s.threshold,
											u = s.findAllMatches,
											h = s.minMatchCharLength;
										return r(e, this.pattern, this.patternAlphabet, {
											location: a,
											distance: c,
											threshold: l,
											findAllMatches: u,
											minMatchCharLength: h
										})
									}
								}]) && n(t.prototype, i), a && n(t, a), e
							}();
						e.exports = a
					},
				"./src/helpers/deep_value.js":
					/*!***********************************!*\
					  !*** ./src/helpers/deep_value.js ***!
					  \***********************************/
					/*! no static exports found */
					function(e, t, i) {
						var n = i( /*! ./is_array */ "./src/helpers/is_array.js");
						e.exports = function(e, t) {
							return function e(t, i, o) {
								if (i) {
									var r = i.indexOf("."),
										s = i,
										a = null; - 1 !== r && (s = i.slice(0, r), a = i.slice(r + 1));
									var c = t[s];
									if (null != c)
										if (a || "string" != typeof c && "number" != typeof c)
											if (n(c))
												for (var l = 0, u = c.length; l < u; l += 1) e(c[l], a, o);
											else a && e(c, a, o);
									else o.push(c.toString())
								} else o.push(t);
								return o
							}(e, t, [])
						}
					},
				"./src/helpers/is_array.js":
					/*!*********************************!*\
					  !*** ./src/helpers/is_array.js ***!
					  \*********************************/
					/*! no static exports found */
					function(e, t) {
						e.exports = function(e) {
							return Array.isArray ? Array.isArray(e) : "[object Array]" === Object.prototype.toString.call(e)
						}
					},
				"./src/index.js":
					/*!**********************!*\
					  !*** ./src/index.js ***!
					  \**********************/
					/*! no static exports found */
					function(e, t, i) {
						function n(e) {
							return (n = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
								return typeof e
							} : function(e) {
								return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
							})(e)
						}

						function o(e, t) {
							for (var i = 0; i < t.length; i++) {
								var n = t[i];
								n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
							}
						}
						var r = i( /*! ./bitap */ "./src/bitap/index.js"),
							s = i( /*! ./helpers/deep_value */ "./src/helpers/deep_value.js"),
							a = i( /*! ./helpers/is_array */ "./src/helpers/is_array.js"),
							c = function() {
								function e(t, i) {
									var n = i.location,
										o = void 0 === n ? 0 : n,
										r = i.distance,
										a = void 0 === r ? 100 : r,
										c = i.threshold,
										l = void 0 === c ? .6 : c,
										u = i.maxPatternLength,
										h = void 0 === u ? 32 : u,
										d = i.caseSensitive,
										f = void 0 !== d && d,
										p = i.tokenSeparator,
										v = void 0 === p ? / +/g : p,
										m = i.findAllMatches,
										g = void 0 !== m && m,
										_ = i.minMatchCharLength,
										y = void 0 === _ ? 1 : _,
										b = i.id,
										E = void 0 === b ? null : b,
										S = i.keys,
										I = void 0 === S ? [] : S,
										O = i.shouldSort,
										C = void 0 === O || O,
										T = i.getFn,
										w = void 0 === T ? s : T,
										k = i.sortFn,
										A = void 0 === k ? function(e, t) {
											return e.score - t.score
										} : k,
										L = i.tokenize,
										x = void 0 !== L && L,
										P = i.matchAllTokens,
										D = void 0 !== P && P,
										j = i.includeMatches,
										M = void 0 !== j && j,
										N = i.includeScore,
										F = void 0 !== N && N,
										K = i.verbose,
										R = void 0 !== K && K;
									! function(e, t) {
										if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
									}(this, e), this.options = {
										location: o,
										distance: a,
										threshold: l,
										maxPatternLength: h,
										isCaseSensitive: f,
										tokenSeparator: v,
										findAllMatches: g,
										minMatchCharLength: y,
										id: E,
										keys: I,
										includeMatches: M,
										includeScore: F,
										shouldSort: C,
										getFn: w,
										sortFn: A,
										verbose: R,
										tokenize: x,
										matchAllTokens: D
									}, this.setCollection(t)
								}
								var t, i, c;
								return t = e, (i = [{
									key: "setCollection",
									value: function(e) {
										return this.list = e, e
									}
								}, {
									key: "search",
									value: function(e) {
										var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
											limit: !1
										};
										this._log('---------\nSearch pattern: "'.concat(e, '"'));
										var i = this._prepareSearchers(e),
											n = i.tokenSearchers,
											o = i.fullSearcher,
											r = this._search(n, o),
											s = r.weights,
											a = r.results;
										return this._computeScore(s, a), this.options.shouldSort && this._sort(a), t.limit && "number" == typeof t.limit && (a = a.slice(0, t.limit)), this._format(a)
									}
								}, {
									key: "_prepareSearchers",
									value: function() {
										var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "",
											t = [];
										if (this.options.tokenize)
											for (var i = e.split(this.options.tokenSeparator), n = 0, o = i.length; n < o; n += 1) t.push(new r(i[n], this.options));
										return {
											tokenSearchers: t,
											fullSearcher: new r(e, this.options)
										}
									}
								}, {
									key: "_search",
									value: function() {
										var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
											t = arguments.length > 1 ? arguments[1] : void 0,
											i = this.list,
											n = {},
											o = [];
										if ("string" == typeof i[0]) {
											for (var r = 0, s = i.length; r < s; r += 1) this._analyze({
												key: "",
												value: i[r],
												record: r,
												index: r
											}, {
												resultMap: n,
												results: o,
												tokenSearchers: e,
												fullSearcher: t
											});
											return {
												weights: null,
												results: o
											}
										}
										for (var a = {}, c = 0, l = i.length; c < l; c += 1)
											for (var u = i[c], h = 0, d = this.options.keys.length; h < d; h += 1) {
												var f = this.options.keys[h];
												if ("string" != typeof f) {
													if (a[f.name] = {
															weight: 1 - f.weight || 1
														}, f.weight <= 0 || f.weight > 1) throw new Error("Key weight has to be > 0 and <= 1");
													f = f.name
												} else a[f] = {
													weight: 1
												};
												this._analyze({
													key: f,
													value: this.options.getFn(u, f),
													record: u,
													index: c
												}, {
													resultMap: n,
													results: o,
													tokenSearchers: e,
													fullSearcher: t
												})
											}
										return {
											weights: a,
											results: o
										}
									}
								}, {
									key: "_analyze",
									value: function(e, t) {
										var i = e.key,
											n = e.arrayIndex,
											o = void 0 === n ? -1 : n,
											r = e.value,
											s = e.record,
											c = e.index,
											l = t.tokenSearchers,
											u = void 0 === l ? [] : l,
											h = t.fullSearcher,
											d = void 0 === h ? [] : h,
											f = t.resultMap,
											p = void 0 === f ? {} : f,
											v = t.results,
											m = void 0 === v ? [] : v;
										if (null != r) {
											var g = !1,
												_ = -1,
												y = 0;
											if ("string" == typeof r) {
												this._log("\nKey: ".concat("" === i ? "-" : i));
												var b = d.search(r);
												if (this._log('Full text: "'.concat(r, '", score: ').concat(b.score)), this.options.tokenize) {
													for (var E = r.split(this.options.tokenSeparator), S = [], I = 0; I < u.length; I += 1) {
														var O = u[I];
														this._log('\nPattern: "'.concat(O.pattern, '"'));
														for (var C = !1, T = 0; T < E.length; T += 1) {
															var w = E[T],
																k = O.search(w),
																A = {};
															k.isMatch ? (A[w] = k.score, g = !0, C = !0, S.push(k.score)) : (A[w] = 1, this.options.matchAllTokens || S.push(1)), this._log('Token: "'.concat(w, '", score: ').concat(A[w]))
														}
														C && (y += 1)
													}
													_ = S[0];
													for (var L = S.length, x = 1; x < L; x += 1) _ += S[x];
													_ /= L, this._log("Token score average:", _)
												}
												var P = b.score;
												_ > -1 && (P = (P + _) / 2), this._log("Score average:", P);
												var D = !this.options.tokenize || !this.options.matchAllTokens || y >= u.length;
												if (this._log("\nCheck Matches: ".concat(D)), (g || b.isMatch) && D) {
													var j = p[c];
													j ? j.output.push({
														key: i,
														arrayIndex: o,
														value: r,
														score: P,
														matchedIndices: b.matchedIndices
													}) : (p[c] = {
														item: s,
														output: [{
															key: i,
															arrayIndex: o,
															value: r,
															score: P,
															matchedIndices: b.matchedIndices
														}]
													}, m.push(p[c]))
												}
											} else if (a(r))
												for (var M = 0, N = r.length; M < N; M += 1) this._analyze({
													key: i,
													arrayIndex: M,
													value: r[M],
													record: s,
													index: c
												}, {
													resultMap: p,
													results: m,
													tokenSearchers: u,
													fullSearcher: d
												})
										}
									}
								}, {
									key: "_computeScore",
									value: function(e, t) {
										this._log("\n\nComputing score:\n");
										for (var i = 0, n = t.length; i < n; i += 1) {
											for (var o = t[i].output, r = o.length, s = 1, a = 1, c = 0; c < r; c += 1) {
												var l = e ? e[o[c].key].weight : 1,
													u = (1 === l ? o[c].score : o[c].score || .001) * l;
												1 !== l ? a = Math.min(a, u) : (o[c].nScore = u, s *= u)
											}
											t[i].score = 1 === a ? s : a, this._log(t[i])
										}
									}
								}, {
									key: "_sort",
									value: function(e) {
										this._log("\n\nSorting...."), e.sort(this.options.sortFn)
									}
								}, {
									key: "_format",
									value: function(e) {
										var t = [];
										if (this.options.verbose) {
											var i = [];
											this._log("\n\nOutput:\n\n", JSON.stringify(e, function(e, t) {
												if ("object" === n(t) && null !== t) {
													if (-1 !== i.indexOf(t)) return;
													i.push(t)
												}
												return t
											})), i = null
										}
										var o = [];
										this.options.includeMatches && o.push(function(e, t) {
											var i = e.output;
											t.matches = [];
											for (var n = 0, o = i.length; n < o; n += 1) {
												var r = i[n];
												if (0 !== r.matchedIndices.length) {
													var s = {
														indices: r.matchedIndices,
														value: r.value
													};
													r.key && (s.key = r.key), r.hasOwnProperty("arrayIndex") && r.arrayIndex > -1 && (s.arrayIndex = r.arrayIndex), t.matches.push(s)
												}
											}
										}), this.options.includeScore && o.push(function(e, t) {
											t.score = e.score
										});
										for (var r = 0, s = e.length; r < s; r += 1) {
											var a = e[r];
											if (this.options.id && (a.item = this.options.getFn(a.item, this.options.id)[0]), o.length) {
												for (var c = {
														item: a.item
													}, l = 0, u = o.length; l < u; l += 1) o[l](a, c);
												t.push(c)
											} else t.push(a.item)
										}
										return t
									}
								}, {
									key: "_log",
									value: function() {
										var e;
										this.options.verbose && (e = console).log.apply(e, arguments)
									}
								}]) && o(t.prototype, i), c && o(t, c), e
							}();
						e.exports = c
					}
			})
		}, e.exports = n()
	}, function(e, t, i) {
		"use strict";
		i.r(t);
		var n = function(e) {
			return function(e) {
				return !!e && "object" == typeof e
			}(e) && ! function(e) {
				var t = Object.prototype.toString.call(e);
				return "[object RegExp]" === t || "[object Date]" === t || function(e) {
					return e.$$typeof === o
				}(e)
			}(e)
		};
		var o = "function" == typeof Symbol && Symbol.for ? Symbol.for("react.element") : 60103;

		function r(e, t) {
			return !1 !== t.clone && t.isMergeableObject(e) ? a((i = e, Array.isArray(i) ? [] : {}), e, t) : e;
			var i
		}

		function s(e, t, i) {
			return e.concat(t).map(function(e) {
				return r(e, i)
			})
		}

		function a(e, t, i) {
			(i = i || {}).arrayMerge = i.arrayMerge || s, i.isMergeableObject = i.isMergeableObject || n;
			var o = Array.isArray(t);
			return o === Array.isArray(e) ? o ? i.arrayMerge(e, t, i) : function(e, t, i) {
				var n = {};
				return i.isMergeableObject(e) && Object.keys(e).forEach(function(t) {
					n[t] = r(e[t], i)
				}), Object.keys(t).forEach(function(o) {
					i.isMergeableObject(t[o]) && e[o] ? n[o] = a(e[o], t[o], i) : n[o] = r(t[o], i)
				}), n
			}(e, t, i) : r(t, i)
		}
		a.all = function(e, t) {
			if (!Array.isArray(e)) throw new Error("first argument should be an array");
			return e.reduce(function(e, i) {
				return a(e, i, t)
			}, {})
		};
		var c = a;
		t.default = c
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = void 0;
		var n, o = i(6),
			r = (n = i(15)) && n.__esModule ? n : {
				default: n
			};

		function s(e, t) {
			for (var i = 0; i < t.length; i++) {
				var n = t[i];
				n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
			}
		}
		var a = function() {
			function e() {
				! function(e, t) {
					if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
				}(this, e), this._store = (0, o.createStore)(r.default, window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__())
			}
			var t, i, n;
			return t = e, (i = [{
				key: "subscribe",
				value: function(e) {
					this._store.subscribe(e)
				}
			}, {
				key: "dispatch",
				value: function(e) {
					this._store.dispatch(e)
				}
			}, {
				key: "isLoading",
				value: function() {
					return this.state.general.loading
				}
			}, {
				key: "getChoiceById",
				value: function(e) {
					return !!e && this.activeChoices.find(function(t) {
						return t.id === parseInt(e, 10)
					})
				}
			}, {
				key: "getGroupById",
				value: function(e) {
					return this.groups.find(function(t) {
						return t.id === parseInt(e, 10)
					})
				}
			}, {
				key: "state",
				get: function() {
					return this._store.getState()
				}
			}, {
				key: "items",
				get: function() {
					return this.state.items
				}
			}, {
				key: "activeItems",
				get: function() {
					return this.items.filter(function(e) {
						return !0 === e.active
					})
				}
			}, {
				key: "highlightedActiveItems",
				get: function() {
					return this.items.filter(function(e) {
						return e.active && e.highlighted
					})
				}
			}, {
				key: "choices",
				get: function() {
					return this.state.choices
				}
			}, {
				key: "activeChoices",
				get: function() {
					return this.choices.filter(function(e) {
						return !0 === e.active
					})
				}
			}, {
				key: "selectableChoices",
				get: function() {
					return this.choices.filter(function(e) {
						return !0 !== e.disabled
					})
				}
			}, {
				key: "searchableChoices",
				get: function() {
					return this.selectableChoices.filter(function(e) {
						return !0 !== e.placeholder
					})
				}
			}, {
				key: "placeholderChoice",
				get: function() {
					return [].concat(this.choices).reverse().find(function(e) {
						return !0 === e.placeholder
					})
				}
			}, {
				key: "groups",
				get: function() {
					return this.state.groups
				}
			}, {
				key: "activeGroups",
				get: function() {
					var e = this.groups,
						t = this.choices;
					return e.filter(function(e) {
						var i = !0 === e.active && !1 === e.disabled,
							n = t.some(function(e) {
								return !0 === e.active && !1 === e.disabled
							});
						return i && n
					}, [])
				}
			}]) && s(t.prototype, i), n && s(t, n), e
		}();
		t.default = a
	}, function(e, t) {
		e.exports = function(e) {
			if (!e.webpackPolyfill) {
				var t = Object.create(e);
				t.children || (t.children = []), Object.defineProperty(t, "loaded", {
					enumerable: !0,
					get: function() {
						return t.l
					}
				}), Object.defineProperty(t, "id", {
					enumerable: !0,
					get: function() {
						return t.i
					}
				}), Object.defineProperty(t, "exports", {
					enumerable: !0
				}), t.webpackPolyfill = 1
			}
			return t
		}
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = void 0;
		var n = i(6),
			o = l(i(16)),
			r = l(i(17)),
			s = l(i(18)),
			a = l(i(19)),
			c = i(0);

		function l(e) {
			return e && e.__esModule ? e : {
				default: e
			}
		}
		var u = (0, n.combineReducers)({
				items: o.default,
				groups: r.default,
				choices: s.default,
				general: a.default
			}),
			h = function(e, t) {
				var i = e;
				if ("CLEAR_ALL" === t.type) i = void 0;
				else if ("RESET_TO" === t.type) return (0, c.cloneObject)(t.state);
				return u(i, t)
			};
		t.default = h
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = function() {
			var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : n,
				t = arguments.length > 1 ? arguments[1] : void 0;
			switch (t.type) {
				case "ADD_ITEM":
					var i = [].concat(e, [{
						id: t.id,
						choiceId: t.choiceId,
						groupId: t.groupId,
						value: t.value,
						label: t.label,
						active: !0,
						highlighted: !1,
						customProperties: t.customProperties,
						placeholder: t.placeholder || !1,
						keyCode: null
					}]);
					return i.map(function(e) {
						var t = e;
						return t.highlighted = !1, t
					});
				case "REMOVE_ITEM":
					return e.map(function(e) {
						var i = e;
						return i.id === t.id && (i.active = !1), i
					});
				case "HIGHLIGHT_ITEM":
					return e.map(function(e) {
						var i = e;
						return i.id === t.id && (i.highlighted = t.highlighted), i
					});
				default:
					return e
			}
		}, t.defaultState = void 0;
		var n = [];
		t.defaultState = n
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = function() {
			var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : n,
				t = arguments.length > 1 ? arguments[1] : void 0;
			switch (t.type) {
				case "ADD_GROUP":
					return [].concat(e, [{
						id: t.id,
						value: t.value,
						active: t.active,
						disabled: t.disabled
					}]);
				case "CLEAR_CHOICES":
					return [];
				default:
					return e
			}
		}, t.defaultState = void 0;
		var n = [];
		t.defaultState = n
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = function() {
			var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : n,
				t = arguments.length > 1 ? arguments[1] : void 0;
			switch (t.type) {
				case "ADD_CHOICE":
					return [].concat(e, [{
						id: t.id,
						elementId: t.elementId,
						groupId: t.groupId,
						value: t.value,
						label: t.label || t.value,
						disabled: t.disabled || !1,
						selected: !1,
						active: !0,
						score: 9999,
						customProperties: t.customProperties,
						placeholder: t.placeholder || !1,
						keyCode: null
					}]);
				case "ADD_ITEM":
					return t.activateOptions ? e.map(function(e) {
						var i = e;
						return i.active = t.active, i
					}) : t.choiceId > -1 ? e.map(function(e) {
						var i = e;
						return i.id === parseInt(t.choiceId, 10) && (i.selected = !0), i
					}) : e;
				case "REMOVE_ITEM":
					return t.choiceId > -1 ? e.map(function(e) {
						var i = e;
						return i.id === parseInt(t.choiceId, 10) && (i.selected = !1), i
					}) : e;
				case "FILTER_CHOICES":
					return e.map(function(e) {
						var i = e;
						return i.active = t.results.some(function(e) {
							var t = e.item,
								n = e.score;
							return t.id === i.id && (i.score = n, !0)
						}), i
					});
				case "ACTIVATE_CHOICES":
					return e.map(function(e) {
						var i = e;
						return i.active = t.active, i
					});
				case "CLEAR_CHOICES":
					return n;
				default:
					return e
			}
		}, t.defaultState = void 0;
		var n = [];
		t.defaultState = n
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = t.defaultState = void 0;
		var n = {
			loading: !1
		};
		t.defaultState = n;
		var o = function() {
			var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : n,
				t = arguments.length > 1 ? arguments[1] : void 0;
			switch (t.type) {
				case "SET_IS_LOADING":
					return {
						loading: t.isLoading
					};
				default:
					return e
			}
		};
		t.default = o
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), Object.defineProperty(t, "Dropdown", {
			enumerable: !0,
			get: function() {
				return n.default
			}
		}), Object.defineProperty(t, "Container", {
			enumerable: !0,
			get: function() {
				return o.default
			}
		}), Object.defineProperty(t, "Input", {
			enumerable: !0,
			get: function() {
				return r.default
			}
		}), Object.defineProperty(t, "List", {
			enumerable: !0,
			get: function() {
				return s.default
			}
		}), Object.defineProperty(t, "WrappedInput", {
			enumerable: !0,
			get: function() {
				return a.default
			}
		}), Object.defineProperty(t, "WrappedSelect", {
			enumerable: !0,
			get: function() {
				return c.default
			}
		});
		var n = l(i(21)),
			o = l(i(22)),
			r = l(i(23)),
			s = l(i(24)),
			a = l(i(25)),
			c = l(i(26));

		function l(e) {
			return e && e.__esModule ? e : {
				default: e
			}
		}
	}, function(e, t, i) {
		"use strict";

		function n(e, t) {
			for (var i = 0; i < t.length; i++) {
				var n = t[i];
				n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
			}
		}
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = void 0;
		var o = function() {
			function e(t) {
				var i = t.element,
					n = t.type,
					o = t.classNames;
				! function(e, t) {
					if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
				}(this, e), Object.assign(this, {
					element: i,
					type: n,
					classNames: o
				}), this.isActive = !1
			}
			var t, i, o;
			return t = e, (i = [{
				key: "distanceFromTopWindow",
				value: function() {
					return this.dimensions = this.element.getBoundingClientRect(), this.position = Math.ceil(this.dimensions.top + window.pageYOffset + this.element.offsetHeight), this.position
				}
			}, {
				key: "getChild",
				value: function(e) {
					return this.element.querySelector(e)
				}
			}, {
				key: "show",
				value: function() {
					return this.element.classList.add(this.classNames.activeState), this.element.setAttribute("aria-expanded", "true"), this.isActive = !0, this
				}
			}, {
				key: "hide",
				value: function() {
					return this.element.classList.remove(this.classNames.activeState), this.element.setAttribute("aria-expanded", "false"), this.isActive = !1, this
				}
			}]) && n(t.prototype, i), o && n(t, o), e
		}();
		t.default = o
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = void 0;
		var n = i(0);

		function o(e, t) {
			for (var i = 0; i < t.length; i++) {
				var n = t[i];
				n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
			}
		}
		var r = function() {
			function e(t) {
				var i = t.element,
					n = t.type,
					o = t.classNames,
					r = t.position;
				! function(e, t) {
					if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
				}(this, e), Object.assign(this, {
					element: i,
					classNames: o,
					type: n,
					position: r
				}), this.isOpen = !1, this.isFlipped = !1, this.isFocussed = !1, this.isDisabled = !1, this.isLoading = !1, this._onFocus = this._onFocus.bind(this), this._onBlur = this._onBlur.bind(this)
			}
			var t, i, r;
			return t = e, (i = [{
				key: "addEventListeners",
				value: function() {
					this.element.addEventListener("focus", this._onFocus), this.element.addEventListener("blur", this._onBlur)
				}
			}, {
				key: "removeEventListeners",
				value: function() {
					this.element.removeEventListener("focus", this._onFocus), this.element.removeEventListener("blur", this._onBlur)
				}
			}, {
				key: "shouldFlip",
				value: function(e) {
					var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (0, n.getWindowHeight)();
					if (void 0 === e) return !1;
					var i = !1;
					return "auto" === this.position ? i = e >= t : "top" === this.position && (i = !0), i
				}
			}, {
				key: "setActiveDescendant",
				value: function(e) {
					this.element.setAttribute("aria-activedescendant", e)
				}
			}, {
				key: "removeActiveDescendant",
				value: function() {
					this.element.removeAttribute("aria-activedescendant")
				}
			}, {
				key: "open",
				value: function(e) {
					this.element.classList.add(this.classNames.openState), this.element.setAttribute("aria-expanded", "true"), this.isOpen = !0, this.shouldFlip(e) && (this.element.classList.add(this.classNames.flippedState), this.isFlipped = !0)
				}
			}, {
				key: "close",
				value: function() {
					this.element.classList.remove(this.classNames.openState), this.element.setAttribute("aria-expanded", "false"), this.removeActiveDescendant(), this.isOpen = !1, this.isFlipped && (this.element.classList.remove(this.classNames.flippedState), this.isFlipped = !1)
				}
			}, {
				key: "focus",
				value: function() {
					this.isFocussed || this.element.focus()
				}
			}, {
				key: "addFocusState",
				value: function() {
					this.element.classList.add(this.classNames.focusState)
				}
			}, {
				key: "removeFocusState",
				value: function() {
					this.element.classList.remove(this.classNames.focusState)
				}
			}, {
				key: "enable",
				value: function() {
					this.element.classList.remove(this.classNames.disabledState), this.element.removeAttribute("aria-disabled"), "select-one" === this.type && this.element.setAttribute("tabindex", "0"), this.isDisabled = !1
				}
			}, {
				key: "disable",
				value: function() {
					this.element.classList.add(this.classNames.disabledState), this.element.setAttribute("aria-disabled", "true"), "select-one" === this.type && this.element.setAttribute("tabindex", "-1"), this.isDisabled = !0
				}
			}, {
				key: "wrap",
				value: function(e) {
					(0, n.wrap)(e, this.element)
				}
			}, {
				key: "unwrap",
				value: function(e) {
					this.element.parentNode.insertBefore(e, this.element), this.element.parentNode.removeChild(this.element)
				}
			}, {
				key: "addLoadingState",
				value: function() {
					this.element.classList.add(this.classNames.loadingState), this.element.setAttribute("aria-busy", "true"), this.isLoading = !0
				}
			}, {
				key: "removeLoadingState",
				value: function() {
					this.element.classList.remove(this.classNames.loadingState), this.element.removeAttribute("aria-busy"), this.isLoading = !1
				}
			}, {
				key: "_onFocus",
				value: function() {
					this.isFocussed = !0
				}
			}, {
				key: "_onBlur",
				value: function() {
					this.isFocussed = !1
				}
			}]) && o(t.prototype, i), r && o(t, r), e
		}();
		t.default = r
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = void 0;
		var n = i(0);

		function o(e, t) {
			for (var i = 0; i < t.length; i++) {
				var n = t[i];
				n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
			}
		}
		var r = function() {
			function e(t) {
				var i = t.element,
					n = t.type,
					o = t.classNames,
					r = t.placeholderValue;
				! function(e, t) {
					if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
				}(this, e), Object.assign(this, {
					element: i,
					type: n,
					classNames: o,
					placeholderValue: r
				}), this.element = i, this.classNames = o, this.isFocussed = this.element === document.activeElement, this.isDisabled = !1, this._onPaste = this._onPaste.bind(this), this._onInput = this._onInput.bind(this), this._onFocus = this._onFocus.bind(this), this._onBlur = this._onBlur.bind(this)
			}
			var t, i, r;
			return t = e, (i = [{
				key: "addEventListeners",
				value: function() {
					this.element.addEventListener("input", this._onInput), this.element.addEventListener("paste", this._onPaste), this.element.addEventListener("focus", this._onFocus), this.element.addEventListener("blur", this._onBlur), this.element.form && this.element.form.addEventListener("reset", this._onFormReset)
				}
			}, {
				key: "removeEventListeners",
				value: function() {
					this.element.removeEventListener("input", this._onInput), this.element.removeEventListener("paste", this._onPaste), this.element.removeEventListener("focus", this._onFocus), this.element.removeEventListener("blur", this._onBlur), this.element.form && this.element.form.removeEventListener("reset", this._onFormReset)
				}
			}, {
				key: "enable",
				value: function() {
					this.element.removeAttribute("disabled"), this.isDisabled = !1
				}
			}, {
				key: "disable",
				value: function() {
					this.element.setAttribute("disabled", ""), this.isDisabled = !0
				}
			}, {
				key: "focus",
				value: function() {
					this.isFocussed || this.element.focus()
				}
			}, {
				key: "blur",
				value: function() {
					this.isFocussed && this.element.blur()
				}
			}, {
				key: "clear",
				value: function() {
					var e = !(arguments.length > 0 && void 0 !== arguments[0]) || arguments[0];
					return this.element.value && (this.element.value = ""), e && this.setWidth(), this
				}
			}, {
				key: "setWidth",
				value: function(e) {
					var t = this,
						i = function(e) {
							t.element.style.width = e
						};
					if (this._placeholderValue) {
						var n = this.element.value.length >= this._placeholderValue.length / 1.25;
						(this.element.value && n || e) && this.calcWidth(i)
					} else this.calcWidth(i)
				}
			}, {
				key: "calcWidth",
				value: function(e) {
					return (0, n.calcWidthOfInput)(this.element, e)
				}
			}, {
				key: "setActiveDescendant",
				value: function(e) {
					this.element.setAttribute("aria-activedescendant", e)
				}
			}, {
				key: "removeActiveDescendant",
				value: function() {
					this.element.removeAttribute("aria-activedescendant")
				}
			}, {
				key: "_onInput",
				value: function() {
					"select-one" !== this.type && this.setWidth()
				}
			}, {
				key: "_onPaste",
				value: function(e) {
					e.target === this.element && this.preventPaste && e.preventDefault()
				}
			}, {
				key: "_onFocus",
				value: function() {
					this.isFocussed = !0
				}
			}, {
				key: "_onBlur",
				value: function() {
					this.isFocussed = !1
				}
			}, {
				key: "placeholder",
				set: function(e) {
					this.element.placeholder = e
				}
			}, {
				key: "value",
				set: function(e) {
					this.element.value = e
				},
				get: function() {
					return (0, n.sanitise)(this.element.value)
				}
			}]) && o(t.prototype, i), r && o(t, r), e
		}();
		t.default = r
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = void 0;
		var n = i(1);

		function o(e, t) {
			for (var i = 0; i < t.length; i++) {
				var n = t[i];
				n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
			}
		}
		var r = function() {
			function e(t) {
				var i = t.element;
				! function(e, t) {
					if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
				}(this, e), Object.assign(this, {
					element: i
				}), this.scrollPos = this.element.scrollTop, this.height = this.element.offsetHeight, this.hasChildren = !!this.element.children
			}
			var t, i, r;
			return t = e, (i = [{
				key: "clear",
				value: function() {
					this.element.innerHTML = ""
				}
			}, {
				key: "append",
				value: function(e) {
					this.element.appendChild(e)
				}
			}, {
				key: "getChild",
				value: function(e) {
					return this.element.querySelector(e)
				}
			}, {
				key: "scrollToTop",
				value: function() {
					this.element.scrollTop = 0
				}
			}, {
				key: "scrollToChoice",
				value: function(e, t) {
					var i = this;
					if (e) {
						var n = this.element.offsetHeight,
							o = e.offsetHeight,
							r = e.offsetTop + o,
							s = this.element.scrollTop + n,
							a = t > 0 ? this.element.scrollTop + r - s : e.offsetTop;
						requestAnimationFrame(function(e) {
							i._animateScroll(e, a, t)
						})
					}
				}
			}, {
				key: "_scrollDown",
				value: function(e, t, i) {
					var n = (i - e) / t,
						o = n > 1 ? n : 1;
					this.element.scrollTop = e + o
				}
			}, {
				key: "_scrollUp",
				value: function(e, t, i) {
					var n = (e - i) / t,
						o = n > 1 ? n : 1;
					this.element.scrollTop = e - o
				}
			}, {
				key: "_animateScroll",
				value: function(e, t, i) {
					var o = this,
						r = n.SCROLLING_SPEED,
						s = this.element.scrollTop,
						a = !1;
					i > 0 ? (this._scrollDown(s, r, t), s < t && (a = !0)) : (this._scrollUp(s, r, t), s > t && (a = !0)), a && requestAnimationFrame(function() {
						o._animateScroll(e, t, i)
					})
				}
			}]) && o(t.prototype, i), r && o(t, r), e
		}();
		t.default = r
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = void 0;
		var n, o = (n = i(4)) && n.__esModule ? n : {
			default: n
		};

		function r(e) {
			return (r = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
				return typeof e
			} : function(e) {
				return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
			})(e)
		}

		function s(e, t) {
			for (var i = 0; i < t.length; i++) {
				var n = t[i];
				n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
			}
		}

		function a(e, t) {
			return !t || "object" !== r(t) && "function" != typeof t ? function(e) {
				if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
				return e
			}(e) : t
		}

		function c(e, t, i) {
			return (c = "undefined" != typeof Reflect && Reflect.get ? Reflect.get : function(e, t, i) {
				var n = function(e, t) {
					for (; !Object.prototype.hasOwnProperty.call(e, t) && null !== (e = l(e)););
					return e
				}(e, t);
				if (n) {
					var o = Object.getOwnPropertyDescriptor(n, t);
					return o.get ? o.get.call(i) : o.value
				}
			})(e, t, i || e)
		}

		function l(e) {
			return (l = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
				return e.__proto__ || Object.getPrototypeOf(e)
			})(e)
		}

		function u(e, t) {
			return (u = Object.setPrototypeOf || function(e, t) {
				return e.__proto__ = t, e
			})(e, t)
		}
		var h = function(e) {
			function t(e) {
				var i, n = e.element,
					o = e.classNames,
					r = e.delimiter;
				return function(e, t) {
					if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
				}(this, t), (i = a(this, l(t).call(this, {
					element: n,
					classNames: o
				}))).delimiter = r, i
			}
			var i, n, r;
			return function(e, t) {
				if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function");
				e.prototype = Object.create(t && t.prototype, {
					constructor: {
						value: e,
						writable: !0,
						configurable: !0
					}
				}), t && u(e, t)
			}(t, o.default), i = t, (n = [{
				key: "value",
				set: function(e) {
					var t = e.map(function(e) {
						return e.value
					}).join(this.delimiter);
					this.element.setAttribute("value", t), this.element.value = t
				},
				get: function() {
					return c(l(t.prototype), "value", this)
				}
			}]) && s(i.prototype, n), r && s(i, r), t
		}();
		t.default = h
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.default = void 0;
		var n = r(i(4)),
			o = r(i(5));

		function r(e) {
			return e && e.__esModule ? e : {
				default: e
			}
		}

		function s(e) {
			return (s = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
				return typeof e
			} : function(e) {
				return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
			})(e)
		}

		function a(e, t) {
			for (var i = 0; i < t.length; i++) {
				var n = t[i];
				n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
			}
		}

		function c(e, t) {
			return !t || "object" !== s(t) && "function" != typeof t ? function(e) {
				if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
				return e
			}(e) : t
		}

		function l(e) {
			return (l = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
				return e.__proto__ || Object.getPrototypeOf(e)
			})(e)
		}

		function u(e, t) {
			return (u = Object.setPrototypeOf || function(e, t) {
				return e.__proto__ = t, e
			})(e, t)
		}
		var h = function(e) {
			function t(e) {
				var i = e.element,
					n = e.classNames;
				return function(e, t) {
					if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
				}(this, t), c(this, l(t).call(this, {
					element: i,
					classNames: n
				}))
			}
			var i, r, s;
			return function(e, t) {
				if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function");
				e.prototype = Object.create(t && t.prototype, {
					constructor: {
						value: e,
						writable: !0,
						configurable: !0
					}
				}), t && u(e, t)
			}(t, n.default), i = t, (r = [{
				key: "appendDocFragment",
				value: function(e) {
					this.element.innerHTML = "", this.element.appendChild(e)
				}
			}, {
				key: "placeholderOption",
				get: function() {
					return this.element.querySelector("option[placeholder]")
				}
			}, {
				key: "optionGroups",
				get: function() {
					return Array.from(this.element.getElementsByTagName("OPTGROUP"))
				}
			}, {
				key: "options",
				get: function() {
					return Array.from(this.element.options)
				},
				set: function(e) {
					var t = document.createDocumentFragment();
					e.forEach(function(e) {
						return i = e, n = o.default.option(i), void t.appendChild(n);
						var i, n
					}), this.appendDocFragment(t)
				}
			}]) && a(i.prototype, r), s && a(i, s), t
		}();
		t.default = h
	}, function(e, t, i) {
		var n;
		/*!
		  Copyright (c) 2017 Jed Watson.
		  Licensed under the MIT License (MIT), see
		  http://jedwatson.github.io/classnames
		*/
		/*!
		  Copyright (c) 2017 Jed Watson.
		  Licensed under the MIT License (MIT), see
		  http://jedwatson.github.io/classnames
		*/
		! function() {
			"use strict";
			var i = {}.hasOwnProperty;

			function o() {
				for (var e = [], t = 0; t < arguments.length; t++) {
					var n = arguments[t];
					if (n) {
						var r = typeof n;
						if ("string" === r || "number" === r) e.push(n);
						else if (Array.isArray(n) && n.length) {
							var s = o.apply(null, n);
							s && e.push(s)
						} else if ("object" === r)
							for (var a in n) i.call(n, a) && n[a] && e.push(a)
					}
				}
				return e.join(" ")
			}
			e.exports ? (o.default = o, e.exports = o) : void 0 === (n = function() {
				return o
			}.apply(t, [])) || (e.exports = n)
		}()
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.clearChoices = t.activateChoices = t.filterChoices = t.addChoice = void 0;
		var n = i(1);
		t.addChoice = function(e) {
			var t = e.value,
				i = e.label,
				o = e.id,
				r = e.groupId,
				s = e.disabled,
				a = e.elementId,
				c = e.customProperties,
				l = e.placeholder,
				u = e.keyCode;
			return {
				type: n.ACTION_TYPES.ADD_CHOICE,
				value: t,
				label: i,
				id: o,
				groupId: r,
				disabled: s,
				elementId: a,
				customProperties: c,
				placeholder: l,
				keyCode: u
			}
		};
		t.filterChoices = function(e) {
			return {
				type: n.ACTION_TYPES.FILTER_CHOICES,
				results: e
			}
		};
		t.activateChoices = function() {
			var e = !(arguments.length > 0 && void 0 !== arguments[0]) || arguments[0];
			return {
				type: n.ACTION_TYPES.ACTIVATE_CHOICES,
				active: e
			}
		};
		t.clearChoices = function() {
			return {
				type: n.ACTION_TYPES.CLEAR_CHOICES
			}
		}
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.highlightItem = t.removeItem = t.addItem = void 0;
		var n = i(1);
		t.addItem = function(e) {
			var t = e.value,
				i = e.label,
				o = e.id,
				r = e.choiceId,
				s = e.groupId,
				a = e.customProperties,
				c = e.placeholder,
				l = e.keyCode;
			return {
				type: n.ACTION_TYPES.ADD_ITEM,
				value: t,
				label: i,
				id: o,
				choiceId: r,
				groupId: s,
				customProperties: a,
				placeholder: c,
				keyCode: l
			}
		};
		t.removeItem = function(e, t) {
			return {
				type: n.ACTION_TYPES.REMOVE_ITEM,
				id: e,
				choiceId: t
			}
		};
		t.highlightItem = function(e, t) {
			return {
				type: n.ACTION_TYPES.HIGHLIGHT_ITEM,
				id: e,
				highlighted: t
			}
		}
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.addGroup = void 0;
		var n = i(1);
		t.addGroup = function(e, t, i, o) {
			return {
				type: n.ACTION_TYPES.ADD_GROUP,
				value: e,
				id: t,
				active: i,
				disabled: o
			}
		}
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.resetTo = t.clearAll = void 0;
		t.clearAll = function() {
			return {
				type: "CLEAR_ALL"
			}
		};
		t.resetTo = function(e) {
			return {
				type: "RESET_TO",
				state: e
			}
		}
	}, function(e, t, i) {
		"use strict";
		Object.defineProperty(t, "__esModule", {
			value: !0
		}), t.setIsLoading = void 0;
		t.setIsLoading = function(e) {
			return {
				type: "SET_IS_LOADING",
				isLoading: e
			}
		}
	}])
});