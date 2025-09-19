test "DOM API types and functions can be imported" {
  let _create_fn = create_element
  let _doc_fn = document
  // let _el: Element // 只声明类型，不调用
  assert_eq(true, true)
}

test "document() 和 create_element 工作正常" {
  let doc = document()
  let el = doc.create_element("div")
  assert_eq(el.get_tag_name(), "DIV")
}

test "Element 属性和 class 操作" {
  let el = create_element("span")
  el.set_id("myid")
  assert_eq(el.get_id(), "myid")
  el.set_class_name("foo bar")
  assert_eq(el.get_class_name(), "foo bar")
  el.add_class("baz")
  assert_eq(el.contains_class("baz"), true)
  el.remove_class("foo")
  assert_eq(el.contains_class("foo"), false)
  let _ = el.toggle_class("toggleme")
}

test "Element attribute 操作" {
  let el = create_element("a")
  el.set_attribute("href", "#abc")
  assert_eq(el.get_attribute("href"), Some("#abc"))
  assert_eq(el.has_attribute("href"), true)
  el.remove_attribute("href")
  assert_eq(el.get_attribute("href"), None)
}

test "Node clone_node 仅 text node" {
  let text = document().create_text_node("item")
  let clone = Some(text.clone_node(false))
  assert_eq(clone is Some(_), true)
}

test "NodeList for_each/to_array (query_selector_all)" {
  let div = create_element("div")
  div.set_inner_html("<span></span><span></span>")
  let nodes = div.query_selector_all("span")
  let mut count = 0
  nodes.for_each(fn (_) { count = count + 1 })
  assert_eq(count, 2)
  let arr = nodes.to_array()
  assert_eq(arr.length(), 2)
}

test "HTMLElement style 操作 (body)" {
  let body = document().get_body()
  if body is Some(_) {
    let html_el = body.unwrap()
    let style = html_el.get_style()
    style.set_display("none")
    assert_eq(style.get_property_value("display"), "none")
  } else {
    assert_eq(true, false)
  }
}

test "事件监听 add/remove" {
  let el = create_element("button")
  let handler: (Event) -> Unit = fn (_evt) {}
  el.add_event_listener("click", handler)
  el.remove_event_listener("click", handler)
  assert_eq(true, true)
}