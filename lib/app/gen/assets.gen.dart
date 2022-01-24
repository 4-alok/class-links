/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  ///File path :assets
  SvgGenImage get google => const SvgGenImage('assets/icons/google.svg');

  ///File path :assets/icons/dsc.svg
  SvgGenImage get dsc => const SvgGenImage('assets/icons/dsc.svg');

  /// File path: assets/icons/meet.svg
  SvgGenImage get meet => const SvgGenImage('assets/icons/meet.svg');

  /// File path: assets/icons/zoom.svg
  SvgGenImage get zoom => const SvgGenImage('assets/icons/zoom.svg');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) =>
      Image(
        key: key,
        image: this,
        frameBuilder: frameBuilder,
        loadingBuilder: loadingBuilder,
        errorBuilder: errorBuilder,
        semanticLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
        width: width,
        height: height,
        color: color,
        colorBlendMode: colorBlendMode,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        centerSlice: centerSlice,
        matchTextDirection: matchTextDirection,
        gaplessPlayback: gaplessPlayback,
        isAntiAlias: isAntiAlias,
        filterQuality: filterQuality,
      );

  String get path => assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      SvgPicture.asset(
        _assetName,
        key: key,
        matchTextDirection: matchTextDirection,
        bundle: bundle,
        package: package,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        placeholderBuilder: placeholderBuilder,
        color: color,
        colorBlendMode: colorBlendMode,
        semanticsLabel: semanticsLabel,
        excludeFromSemantics: excludeFromSemantics,
        clipBehavior: clipBehavior,
      );

  String get path => _assetName;
}
