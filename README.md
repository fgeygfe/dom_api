# dom_api

## Supported DOM APIs

### Document
- get_element_by_id
- get_elements_by_tag_name
- get_elements_by_class_name
- query_selector
- query_selector_all
- create_element
- create_text_node
- get_body
- get_head

### Element
- get_attribute
- set_attribute
- remove_attribute
- has_attribute
- get_tag_name
- get_id / set_id
- get_class_name / set_class_name
- add_class / remove_class / toggle_class / contains_class
- get_inner_html / set_inner_html
- get_text_content / set_text_content
- query_selector / query_selector_all
- add_event_listener / remove_event_listener / dispatch_event

### Node
- append_child
- insert_before
- remove_child
- replace_child
- clone_node
- get_parent_node
- get_first_child
- get_last_child
- get_next_sibling
- get_previous_sibling
- get_child_nodes

### HTMLElement
- click
- focus
- blur
- get_style
- get_offset_width / get_offset_height
- get_client_width / get_client_height
- get_scroll_width / get_scroll_height
- get_scroll_top / set_scroll_top
- get_scroll_left / set_scroll_left

### Event
- prevent_default
- stop_propagation
- stop_immediate_propagation
- get_type
- get_target
- get_current_target

### NodeList
- length
- item
- get
- for_each
- to_array

### CSSStyleDeclaration
- get_property_value
- set_property
- remove_property
- set_display
- set_color
- set_background_color
- set_width
- set_height

### Global Functions
- document()
- window
- create_element
- get_element_by_id
- query_selector
- query_selector_all
