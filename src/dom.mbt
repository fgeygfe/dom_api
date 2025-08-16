///| DOM Document interface
pub struct Document(@js.Value)

///| DOM Element interface
pub struct Element(@js.Value)

///| HTML Element interface, extends Element
pub struct HTMLElement(Element)

///| DOM Node interface
pub struct Node(@js.Value)

///| DOM Event interface
pub struct Event(@js.Value)

///| DOM NodeList interface
pub struct NodeList(@js.Value)

///| DOM HTMLCollection interface
pub struct HTMLCollection(@js.Value)

///| Style declaration interface
pub struct CSSStyleDeclaration(@js.Value)

// Conversion functions

///|
pub fn Element::to_html_element(self : Element) -> HTMLElement {
  HTMLElement(self)
}

///|
pub fn HTMLElement::to_element(self : HTMLElement) -> Element {
  let HTMLElement(element) = self
  element
}

///|
pub fn Element::to_node(self : Element) -> Node {
  Node(self.0)
}

///|
pub fn Node::to_element(self : Node) -> Element? {
  @js.Cast::into(self.0)
}

// Cast implementations for DOM types

///|
extern "js" fn checked_cast_document_ffi(
  value : @js.Value,
) -> @js.Nullable[Document] =
  #| (x) => x instanceof Document ? x : null

///|
pub impl @js.Cast for Document with into(value) {
  checked_cast_document_ffi(value).to_option()
}

///|
pub impl @js.Cast for Document with from(value) {
  @js.Value::cast_from(value)
}

///|
extern "js" fn checked_cast_element_ffi(
  value : @js.Value,
) -> @js.Nullable[Element] =
  #| (x) => x instanceof Element ? x : null

///|
pub impl @js.Cast for Element with into(value) {
  checked_cast_element_ffi(value).to_option()
}

///|
pub impl @js.Cast for Element with from(value) {
  @js.Value::cast_from(value)
}

///|
extern "js" fn checked_cast_html_element_ffi(
  value : @js.Value,
) -> @js.Nullable[HTMLElement] =
  #| (x) => x instanceof HTMLElement ? x : null

///|
pub impl @js.Cast for HTMLElement with into(value) {
  checked_cast_html_element_ffi(value).to_option()
}

///|
pub impl @js.Cast for HTMLElement with from(value) {
  @js.Value::cast_from(value)
}

///|
extern "js" fn checked_cast_node_ffi(value : @js.Value) -> @js.Nullable[Node] =
  #| (x) => x instanceof Node ? x : null

///|
pub impl @js.Cast for Node with into(value) {
  checked_cast_node_ffi(value).to_option()
}

///|
pub impl @js.Cast for Node with from(value) {
  @js.Value::cast_from(value)
}

///|
extern "js" fn checked_cast_event_ffi(value : @js.Value) -> @js.Nullable[Event] =
  #| (x) => x instanceof Event ? x : null

///|
pub impl @js.Cast for Event with into(value) {
  checked_cast_event_ffi(value).to_option()
}

///|
pub impl @js.Cast for Event with from(value) {
  @js.Value::cast_from(value)
}

// Document methods

///|
pub extern "js" fn Document::get_element_by_id(
  self : Document,
  id : String,
) -> Element? =
  #| (doc, id) => doc.getElementById(id)

///|
pub extern "js" fn Document::get_elements_by_tag_name(
  self : Document,
  tagName : String,
) -> NodeList =
  #| (doc, tagName) => doc.getElementsByTagName(tagName)

///|
pub extern "js" fn Document::get_elements_by_class_name(
  self : Document,
  className : String,
) -> NodeList =
  #| (doc, className) => doc.getElementsByClassName(className)

///|
pub extern "js" fn Document::query_selector(
  self : Document,
  selector : String,
) -> Element? =
  #| (doc, selector) => doc.querySelector(selector)

///|
pub extern "js" fn Document::query_selector_all(
  self : Document,
  selector : String,
) -> NodeList =
  #| (doc, selector) => doc.querySelectorAll(selector)

///|
pub extern "js" fn Document::create_element(
  self : Document,
  tagName : String,
) -> Element =
  #| (doc, tagName) => doc.createElement(tagName)

///|
pub extern "js" fn Document::create_text_node(
  self : Document,
  text : String,
) -> Node =
  #| (doc, text) => doc.createTextNode(text)

///|
pub extern "js" fn Document::get_body(self : Document) -> HTMLElement? =
  #| (doc) => doc.body

///|
pub extern "js" fn Document::get_head(self : Document) -> HTMLElement? =
  #| (doc) => doc.head

// Element methods

///|
pub extern "js" fn Element::get_attribute(
  self : Element,
  name : String,
) -> String? =
  #| (elem, name) => elem.getAttribute(name)

///|
pub extern "js" fn Element::set_attribute(
  self : Element,
  name : String,
  value : String,
) -> Unit =
  #| (elem, name, value) => elem.setAttribute(name, value)

///|
pub extern "js" fn Element::remove_attribute(
  self : Element,
  name : String,
) -> Unit =
  #| (elem, name) => elem.removeAttribute(name)

///|
pub extern "js" fn Element::has_attribute(
  self : Element,
  name : String,
) -> Bool =
  #| (elem, name) => elem.hasAttribute(name)

///|
pub extern "js" fn Element::get_tag_name(self : Element) -> String =
  #| (elem) => elem.tagName

///|
pub extern "js" fn Element::get_id(self : Element) -> String =
  #| (elem) => elem.id

///|
pub extern "js" fn Element::set_id(self : Element, id : String) -> Unit =
  #| (elem, id) => elem.id = id

///|
pub extern "js" fn Element::get_class_name(self : Element) -> String =
  #| (elem) => elem.className

///|
pub extern "js" fn Element::set_class_name(
  self : Element,
  className : String,
) -> Unit =
  #| (elem, className) => elem.className = className

///|
pub extern "js" fn Element::add_class(
  self : Element,
  className : String,
) -> Unit =
  #| (elem, className) => elem.classList.add(className)

///|
pub extern "js" fn Element::remove_class(
  self : Element,
  className : String,
) -> Unit =
  #| (elem, className) => elem.classList.remove(className)

///|
pub extern "js" fn Element::toggle_class(
  self : Element,
  className : String,
) -> Bool =
  #| (elem, className) => elem.classList.toggle(className)

///|
pub extern "js" fn Element::contains_class(
  self : Element,
  className : String,
) -> Bool =
  #| (elem, className) => elem.classList.contains(className)

///|
pub extern "js" fn Element::get_inner_html(self : Element) -> String =
  #| (elem) => elem.innerHTML

///|
pub extern "js" fn Element::set_inner_html(
  self : Element,
  html : String,
) -> Unit =
  #| (elem, html) => elem.innerHTML = html

///|
pub extern "js" fn Element::get_text_content(self : Element) -> String =
  #| (elem) => elem.textContent || ""

///|
pub extern "js" fn Element::set_text_content(
  self : Element,
  text : String,
) -> Unit =
  #| (elem, text) => elem.textContent = text

///|
pub extern "js" fn Element::query_selector(
  self : Element,
  selector : String,
) -> Element? =
  #| (elem, selector) => elem.querySelector(selector)

///|
pub extern "js" fn Element::query_selector_all(
  self : Element,
  selector : String,
) -> NodeList =
  #| (elem, selector) => elem.querySelectorAll(selector)

// Node methods

///|
pub extern "js" fn Node::append_child(self : Node, child : Node) -> Node =
  #| (parent, child) => parent.appendChild(child)

///|
pub extern "js" fn Node::insert_before(
  self : Node,
  newNode : Node,
  referenceNode : Node?,
) -> Node =
  #| (parent, newNode, refNode) => parent.insertBefore(newNode, refNode)

///|
pub extern "js" fn Node::remove_child(self : Node, child : Node) -> Node =
  #| (parent, child) => parent.removeChild(child)

///|
pub extern "js" fn Node::replace_child(
  self : Node,
  newChild : Node,
  oldChild : Node,
) -> Node =
  #| (parent, newChild, oldChild) => parent.replaceChild(newChild, oldChild)

///|
pub extern "js" fn Node::clone_node(self : Node, deep : Bool) -> Node =
  #| (node, deep) => node.cloneNode(deep)

///|
pub extern "js" fn Node::get_parent_node(self : Node) -> Node? =
  #| (node) => node.parentNode

///|
pub extern "js" fn Node::get_first_child(self : Node) -> Node? =
  #| (node) => node.firstChild

///|
pub extern "js" fn Node::get_last_child(self : Node) -> Node? =
  #| (node) => node.lastChild

///|
pub extern "js" fn Node::get_next_sibling(self : Node) -> Node? =
  #| (node) => node.nextSibling

///|
pub extern "js" fn Node::get_previous_sibling(self : Node) -> Node? =
  #| (node) => node.previousSibling

///|
pub extern "js" fn Node::get_child_nodes(self : Node) -> NodeList =
  #| (node) => node.childNodes

// HTMLElement methods

///|
pub extern "js" fn HTMLElement::click(self : HTMLElement) -> Unit =
  #| (elem) => elem.click()

///|
pub extern "js" fn HTMLElement::focus(self : HTMLElement) -> Unit =
  #| (elem) => elem.focus()

///|
pub extern "js" fn HTMLElement::blur(self : HTMLElement) -> Unit =
  #| (elem) => elem.blur()

///|
pub extern "js" fn HTMLElement::get_style(
  self : HTMLElement,
) -> CSSStyleDeclaration =
  #| (elem) => elem.style

///|
pub extern "js" fn HTMLElement::get_offset_width(self : HTMLElement) -> Double =
  #| (elem) => elem.offsetWidth

///|
pub extern "js" fn HTMLElement::get_offset_height(self : HTMLElement) -> Double =
  #| (elem) => elem.offsetHeight

///|
pub extern "js" fn HTMLElement::get_client_width(self : HTMLElement) -> Double =
  #| (elem) => elem.clientWidth

///|
pub extern "js" fn HTMLElement::get_client_height(self : HTMLElement) -> Double =
  #| (elem) => elem.clientHeight

///|
pub extern "js" fn HTMLElement::get_scroll_width(self : HTMLElement) -> Double =
  #| (elem) => elem.scrollWidth

///|
pub extern "js" fn HTMLElement::get_scroll_height(self : HTMLElement) -> Double =
  #| (elem) => elem.scrollHeight

///|
pub extern "js" fn HTMLElement::get_scroll_top(self : HTMLElement) -> Double =
  #| (elem) => elem.scrollTop

///|
pub extern "js" fn HTMLElement::set_scroll_top(
  self : HTMLElement,
  value : Double,
) -> Unit =
  #| (elem, value) => elem.scrollTop = value

///|
pub extern "js" fn HTMLElement::get_scroll_left(self : HTMLElement) -> Double =
  #| (elem) => elem.scrollLeft

///|
pub extern "js" fn HTMLElement::set_scroll_left(
  self : HTMLElement,
  value : Double,
) -> Unit =
  #| (elem, value) => elem.scrollLeft = value

// Event handling

///|
pub extern "js" fn Element::add_event_listener(
  self : Element,
  event_type : String,
  listener : (Event) -> Unit,
  options~ : @js.Optional[Bool] = @js.Optional::undefined(),
) -> Unit =
  #| (elem, type, listener, options) => elem.addEventListener(type, listener, options)

///|
pub extern "js" fn Element::remove_event_listener(
  self : Element,
  event_type : String,
  listener : (Event) -> Unit,
  options~ : @js.Optional[Bool] = @js.Optional::undefined(),
) -> Unit =
  #| (elem, type, listener, options) => elem.removeEventListener(type, listener, options)

///|
pub extern "js" fn Element::dispatch_event(
  self : Element,
  event : Event,
) -> Bool =
  #| (elem, event) => elem.dispatchEvent(event)

// Event methods

///|
pub extern "js" fn Event::prevent_default(self : Event) -> Unit =
  #| (event) => event.preventDefault()

///|
pub extern "js" fn Event::stop_propagation(self : Event) -> Unit =
  #| (event) => event.stopPropagation()

///|
pub extern "js" fn Event::stop_immediate_propagation(self : Event) -> Unit =
  #| (event) => event.stopImmediatePropagation()

///|
pub extern "js" fn Event::get_type(self : Event) -> String =
  #| (event) => event.type

///|
pub extern "js" fn Event::get_target(self : Event) -> Element? =
  #| (event) => event.target

///|
pub extern "js" fn Event::get_current_target(self : Event) -> Element? =
  #| (event) => event.currentTarget

// NodeList methods

///|
pub extern "js" fn NodeList::length(self : NodeList) -> Int =
  #| (list) => list.length

///|
pub extern "js" fn NodeList::item(self : NodeList, index : Int) -> Node? =
  #| (list, index) => list.item(index)

///|
pub fn NodeList::get(self : NodeList, index : Int) -> Node? {
  self.item(index)
}

///|
pub fn NodeList::for_each(self : NodeList, f : (Node) -> Unit) -> Unit {
  let len = self.length()
  for i = 0; i < len; i = i + 1 {
    match self.get(i) {
      Some(node) => f(node)
      None => continue
    }
  }
}

///|
pub fn NodeList::to_array(self : NodeList) -> Array[Node] {
  let len = self.length()
  let result = Array::new(capacity=len)
  for i = 0; i < len; i = i + 1 {
    match self.get(i) {
      Some(node) => result.push(node)
      None => continue
    }
  }
  result
}

// CSS Style Declaration methods

///|
pub extern "js" fn CSSStyleDeclaration::get_property_value(
  self : CSSStyleDeclaration,
  property : String,
) -> String =
  #| (style, prop) => style.getPropertyValue(prop)

///|
pub extern "js" fn CSSStyleDeclaration::set_property(
  self : CSSStyleDeclaration,
  property : String,
  value : String,
  priority~ : @js.Optional[String] = @js.Optional::undefined(),
) -> Unit =
  #| (style, prop, value, priority) => style.setProperty(prop, value, priority)

///|
pub extern "js" fn CSSStyleDeclaration::remove_property(
  self : CSSStyleDeclaration,
  property : String,
) -> String =
  #| (style, prop) => style.removeProperty(prop)

// Utility functions for common CSS properties

///|
pub fn CSSStyleDeclaration::set_display(
  self : CSSStyleDeclaration,
  value : String,
) -> Unit {
  self.set_property("display", value)
}

///|
pub fn CSSStyleDeclaration::set_color(
  self : CSSStyleDeclaration,
  value : String,
) -> Unit {
  self.set_property("color", value)
}

///|
pub fn CSSStyleDeclaration::set_background_color(
  self : CSSStyleDeclaration,
  value : String,
) -> Unit {
  self.set_property("background-color", value)
}

///|
pub fn CSSStyleDeclaration::set_width(
  self : CSSStyleDeclaration,
  value : String,
) -> Unit {
  self.set_property("width", value)
}

///|
pub fn CSSStyleDeclaration::set_height(
  self : CSSStyleDeclaration,
  value : String,
) -> Unit {
  self.set_property("height", value)
}

// Global functions

///|
extern "js" fn get_document() -> Document = "() => document"

///|
extern "js" fn get_window() -> @js.Value = "() => window"

///| Get the global document object
/// Global document access (lazy initialization for browser environment)
pub fn document() -> Document {
  get_document()
}

///| Get the global window object
pub let window : @js.Value = get_window()

// Convenience functions

///|
pub fn create_element(tagName : String) -> Element {
  document().create_element(tagName)
}

///|
pub fn get_element_by_id(id : String) -> Element? {
  document().get_element_by_id(id)
}

///|
pub fn query_selector(selector : String) -> Element? {
  document().query_selector(selector)
}

///|
pub fn query_selector_all(selector : String) -> NodeList {
  document().query_selector_all(selector)
}
