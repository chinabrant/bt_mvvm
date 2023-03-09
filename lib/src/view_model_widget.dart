import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 监听或者获取整个ViewModel
abstract class ViewModelWidget<T extends ChangeNotifier> extends Widget {
  final bool listen;

  const ViewModelWidget({
    Key? key,
    this.listen = true,
  }) : super(key: key);

  @protected
  Widget build(BuildContext context, T viewModel);

  @override
  _ViewModelBuilderElement<T> createElement() {
    return _ViewModelBuilderElement<T>(this);
  }
}

class _ViewModelBuilderElement<T extends ChangeNotifier>
    extends ComponentElement {
  _ViewModelBuilderElement(ViewModelWidget widget) : super(widget);

  @override
  ViewModelWidget get widget => super.widget as ViewModelWidget<T>;

  @override
  Widget build() {
    return widget.build(this, Provider.of<T>(this, listen: widget.listen));
  }

  @override
  void update(covariant Widget newWidget) {
    super.update(newWidget);

    assert(widget == newWidget);
    rebuild();
  }
}
