class_name AttachmentSlot extends RemoteTransform3D


func is_attached() -> bool:
	return not remote_path.is_empty()


func attach(node: Node) -> void:
	remote_path = node.get_path()


func detach() -> void:
	remote_path = ^""
