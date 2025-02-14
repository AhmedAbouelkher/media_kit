# [package:media_kit](https://github.com/alexmercerind/media_kit)

A complete video & audio playback library for Flutter & Dart. Performant, stable, feature-proof & modular.

[![](https://img.shields.io/discord/1079685977523617792?color=33cd57&label=Discord&logo=discord&logoColor=discord)](https://discord.gg/h7qf2R9n57) [![Github Actions](https://github.com/alexmercerind/media_kit/actions/workflows/ci.yml/badge.svg)](https://github.com/alexmercerind/media_kit/actions/workflows/ci.yml)

##### package:media_kit is in active development & documentation is under construction... 🏗️

<hr>

<strong>Sponsored with 💖 by</strong>

<a href="https://getstream.io/chat/sdk/flutter/?utm_source=alexmercerind_dart&utm_medium=Github_Repo_Content_Ad&utm_content=Developer&utm_campaign=alexmercerind_December2022_FlutterSDK_klmh22" target="_blank">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/28951144/204903234-4a64b63c-2fc2-4eef-be44-d287d27021e5.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/28951144/204903022-bbaa49ca-74c2-4a8f-a05d-af8314bfd2cc.svg">
    <img alt="Stream Chat" width="300" height="auto" src="https://user-images.githubusercontent.com/28951144/204903022-bbaa49ca-74c2-4a8f-a05d-af8314bfd2cc.svg">
  </picture>
</a>

<h6>
  Rapidly ship in-app messaging with Stream's highly reliable chat infrastructure & feature-rich SDKs, including Flutter!
</h6>

<strong>
  <a href="https://getstream.io/chat/sdk/flutter/?utm_source=alexmercerind_dart&utm_medium=Github_Repo_Content_Ad&utm_content=Developer&utm_campaign=alexmercerind_December2022_FlutterSDK_klmh22" target="_blank">
  Try the Flutter Chat tutorial
  </a>
</strong>

<br></br>

<a href="https://ottomatic.io/" target="_blank">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/28951144/228648854-e5d7c557-ee92-47b2-a037-17b447873e1c.svg">
    <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/28951144/228648844-f2a59ab1-12cd-4fee-bc8d-b2d332033c45.svg">
    <img alt="Stream Chat" width="300" height="auto" src="https://user-images.githubusercontent.com/28951144/228648844-f2a59ab1-12cd-4fee-bc8d-b2d332033c45.svg">
  </picture>
</a>
<br></br>
<strong>
  <a href="https://ottomatic.io/" target="_blank">
  Clever Apps for Film Professionals
  </a>
</strong>

<hr>

https://user-images.githubusercontent.com/28951144/230392090-b50c8e8e-2224-4827-950e-a0df35c7ea01.mp4

<br>

**Notes:**
- The video is recorded on entry-level AMD Ryzen 3 2200U with integrated Radeon Vega 3 Mobile Graphics.
- See process specific resource usage _i.e._ `media_kit_test.exe`. Overall usage is high due to screen recording.

## Installation

Add in your `pubspec.yaml`:

```yaml
dependencies:
  media_kit: ^0.0.4
  # For video rendering.
  media_kit_video: ^0.0.4
  # Enables support for higher number of concurrent instances. Optional.
  media_kit_native_event_loop: ^1.0.2
  # Pick based on your requirements / platform:
  media_kit_libs_windows_video: ^1.0.1          # Windows package for video (& audio) native libraries.
  media_kit_libs_ios_video: ^1.0.4              # iOS package for video (& audio) native libraries.
  media_kit_libs_macos_video: ^1.0.4            # macOS package for video (& audio) native libraries.
  media_kit_libs_linux: ^1.0.1                  # Linux dependency package.
```

## Platforms

| Platform  | Audio | Video |
| --------- | ----- | ----- |
| Windows   | Ready | Ready |
| GNU/Linux | Ready | Ready |
| macOS     | Ready | Ready |
| iOS       | Ready | Ready |
| Android   | [WIP](https://github.com/alexmercerind/media_kit/pull/100)   | [WIP](https://github.com/alexmercerind/media_kit/pull/100)   |
| Web       | WIP   | WIP   |

## Guide

#### Control audio or video playback

```dart
import 'package:media_kit/media_kit.dart';

/// Create a [Player] instance for audio or video playback.

final player = Player();

/// Subscribe to event streams & listen to updates.

player.streams.playlist.listen((e) => print(e));
player.streams.playing.listen((e) => print(e));
player.streams.completed.listen((e) => print(e));
player.streams.position.listen((e) => print(e));
player.streams.duration.listen((e) => print(e));
player.streams.volume.listen((e) => print(e));
player.streams.rate.listen((e) => print(e));
player.streams.pitch.listen((e) => print(e));
player.streams.buffering.listen((e) => print(e));
player.streams.audioParams.listen((e) => print(e));
player.streams.audioBitrate.listen((e) => print(e));
player.streams.audioDevice.listen((e) => print(e));
player.streams.audioDevices.listen((e) => print(e));


/// Open a playable [Media] or [Playlist].

await player.open(Media('file:///C:/Users/Hitesh/Music/Sample.mp3'));
await player.open(Media('file:///C:/Users/Hitesh/Video/Sample.mkv'));
await player.open(Media('asset:///videos/bee.mp4'));
await player.open(
  Playlist(
    [
      Media('https://www.example.com/sample.mp4'),
      Media('rtsp://www.example.com/live'),
    ],
    /// Select the starting index.
    index: 1,
  ),
  /// Select whether playback should start or not.
  play: false,
);

/// Control playback state.

await player.play();
await player.pause();
await player.playOrPause();
await player.seek(const Duration(seconds: 10));

/// Use or modify the queue.

await player.next();
await player.previous();
await player.jump(2);
await player.add(Media('https://www.example.com/sample.mp4'));
await player.move(0, 2);

/// Customize speed, pitch, volume, shuffle, playlist mode, audio device.

await player.setRate(1.0);
await player.setPitch(1.2);
await player.setVolume(50.0);
await player.setShuffle(false);
await player.setPlaylistMode(PlaylistMode.loop);
await player.setAudioDevice(AudioDevice.auto());

/// Release allocated resources back to the system.

await player.dispose();
```

#### Display video output

Performant & H/W accelerated, automatically fallbacks to S/W rendering if system does not support it.

```dart
import 'package:flutter/material.dart';

import 'package:media_kit/media_kit.dart';                        /// Provides [Player], [Media], [Playlist] etc.
import 'package:media_kit_video/media_kit_video.dart';            /// Provides [VideoController] & [Video] etc.

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);
  @override
  State<MyScreen> createState() => _MyScreenState();
}

class MyScreenState extends State<MyScreen> {
  /// Create a [Player].
  final Player player = Player();
  /// Store reference to the [VideoController].
  VideoController? controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      /// Create a [VideoController] to show video output of the [Player].
      controller = await VideoController.create(player);
      setState(() {});
    });
  }

  @override
  void dispose() {
    Future.microtask(() async {
      /// Release allocated resources back to the system.
      await controller?.dispose();
      await player.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Use [Video] widget to display the output.
    return Video(
      /// Pass the [controller].
      controller: controller,
    );
  }
}
```

#### Performance

Although [package:media_kit](https://github.com/alexmercerind/media_kit) is already fairly performant, you can further optimize things as follows:

**Note**

- You can limit size of the video output by specifying `width` & `height`.
- By default, both `height` & `width` are `null` i.e. output is based on video's resolution.

```dart
final controller = await VideoController.create(
  player,
  width: 640,                                   // default: null
  height: 360,                                  // default: null
);
```

**Note**

- You can switch between GPU & CPU rendering by specifying `enableHardwareAcceleration`.
- By default, `enableHardwareAcceleration` is `true` i.e. GPU (Direct3D/OpenGL/METAL) is utilized.

```dart
final controller = await VideoController.create(
  player,
  enableHardwareAcceleration: false,            // default: true
);
```

**Note**

- You can disable event callbacks for a `Player` & save yourself few CPU cycles.
- By default, `events` is `true` i.e. event streams & states are updated.

```dart
final player = Player(
  configuration: PlayerConfiguration(
    events: false,                              // default: true
  ),
);
```

### Detailed Guide

_TODO: documentation_

Try out [the test application](https://github.com/harmonoid/media_kit/blob/master/media_kit_test/lib/main.dart) for now.

## Setup

### Windows

_Windows 7 or higher is supported._

Everything ready. Just add **only one** of the following packages to your `pubspec.yaml` (if not already):

```yaml
dependencies:
  ...
  media_kit_libs_windows_video: ^1.0.1       # Windows package for video (& audio) native libraries.
  media_kit_libs_windows_audio: ^1.0.1       # Windows package for audio (only) native libraries.
```

### Linux

_Any modern Linux distribution is supported._

System shared libraries from distribution specific user-installed packages are used by-default. You can install these as follows.

#### Ubuntu / Debian

```bash
sudo apt install libmpv-dev mpv
```

#### Packaging

There are other ways to bundle these within your app package e.g. within Snap or Flatpak. Few examples:

- [Celluloid](https://github.com/celluloid-player/celluloid/blob/master/flatpak/io.github.celluloid_player.Celluloid.json)
- [VidCutter](https://github.com/ozmartian/vidcutter/tree/master/\_packaging)


Add following package to your `pubspec.yaml` (if not already).

```yaml
dependencies:
  ...
  media_kit_libs_linux: ^1.0.1                   # GNU/Linux dependency package.
```


### macOS

_macOS 11.0 or higher is supported._

Everything ready. Just add **only one** of the following packages to your `pubspec.yaml` (if not already).

```yaml
dependencies:
  ...
  media_kit_libs_macos_video: ^1.0.4             # macOS package for video (& audio) native libraries.
  media_kit_libs_macos_audio: ^1.0.4             # macOS package for audio (only) native libraries.
```

During the build phase, the following warnings are not critical and cannot be silenced:

```log
#import "Headers/media_kit_video-Swift.h"
        ^
/path/to/media_kit/media_kit_test/build/macos/Build/Products/Debug/media_kit_video/media_kit_video.framework/Headers/media_kit_video-Swift.h:270:31: warning: 'objc_ownership' only applies to Objective-C object or block pointer types; type here is 'CVPixelBufferRef' (aka 'struct __CVBuffer *')
- (CVPixelBufferRef _Nullable __unsafe_unretained)copyPixelBuffer SWIFT_WARN_UNUSED_RESULT;
```

```log
# 1 "<command line>" 1
 ^
<command line>:20:9: warning: 'POD_CONFIGURATION_DEBUG' macro redefined
#define POD_CONFIGURATION_DEBUG 1 DEBUG=1 
        ^
#define POD_CONFIGURATION_DEBUG 1
        ^
```

### iOS

_iOS 13.0 or higher is supported._

Everything ready. Just add **only one** of the following packages to your `pubspec.yaml` (if not already):

```yaml
dependencies:
  media_kit_libs_ios_video: ^1.0.4              # iOS package for video (& audio) native libraries.
  media_kit_libs_ios_audio: ^1.0.4              # iOS package for audio (only) native libraries.
```

Known bug: The sound does not work in the simulator.

## Goals

[package:media_kit](https://github.com/alexmercerind/media_kit) is a library for Flutter & Dart which **provides audio & video playback**.

- **Strong:** Supports _most_ audio & video codecs.
- **Performant:**
  - Handles multiple FHD videos flawlessly.
  - Rendering is GPU powered (hardware accelerated).
  - 4K / 8K 60 FPS is supported.
- **Stable:** Implementation is well tested & used across number of intensive media playback related apps.
- **Feature Proof:** A simple usage API offering large number of features to target multitude of apps.
- **Modular:** Project is split into number of packages for reducing bundle size.
- **Cross Platform**: Implementation works on all platforms supported by Flutter & Dart:
  - Windows
  - GNU/Linux
  - macOS
  - iOS
  - ~~Android~~ [WIP]
  - ~~Web~~ [WIP]
- **Flexible Architecture:**
  - Major part of implementation (80%+) is in 100% Dart (using [FFI](https://dart.dev/guides/libraries/c-interop)) & shared across platforms.
    - Makes behavior of library same & more predictable across platforms.
    - Makes development & implementation of new features easier & faster.
    - Avoids separate maintenance of native implementation for each platform.
  - Only video embedding code is platform specific & part of separate package.
  - Learn more: [Architecture](https://github.com/alexmercerind/media_kit#architecture), [Implementation](https://github.com/alexmercerind/media_kit#implementation).

The project aims to meet demands of the community, this includes:
1. Holding accountability.
2. Ensuring timely maintenance.

## Fund Development

If you find [package:media_kit](https://github.com/alexmercerind/media_kit) package(s) useful, please consider sponsoring me.

Since this is first of a kind project, it takes a lot of time to experiment & develop. It's a very tedious process to write code, document, maintain & provide support for free. Your support can ensure the quality of the package your project depends upon. I will feel rewarded for my hard-work & research.

- **[GitHub Sponsors](https://github.com/sponsors/alexmercerind)**
- **[PayPal](https://paypal.me/alexmercerind)**

<a href='https://github.com/sponsors/alexmercerind'><img src='https://github.githubassets.com/images/modules/site/sponsors/sponsors-mona.svg' width='240'></a>

Thanks!

## Architecture

### package:media_kit

_Click on the zoom button on top-right or pinch inside._

```mermaid
%%{
  init: {
    'themeVariables': {
      'fontFamily': 'BlinkMacSystemFont, Segoe UI, Noto Sans, Helvetica, Arial, Apple Color Emoji, Segoe UI Emoji'
    }
  }
}%%
classDiagram

  Player *-- PlatformPlayer
  PlatformPlayer <|-- libmpv_Player
  PlatformPlayer <|-- xyz_Player
  PlatformPlayer *-- PlayerState
  PlatformPlayer *-- PlayerStreams
  PlatformPlayer o-- PlayerConfiguration

  libmpv_Player <.. NativeLibrary

  class Media {
    +String uri
    +dynamic extras
  }

  class Playlist {
    +List<Media> medias
    +index index
  }

  class PlayerConfiguration {
    + bool osc
    + String vo
    + String title
    ... other platform-specific configurable values
  }

  class PlayerStreams {
    +Stream<Playlist> playlist
    +Stream<bool> isPlaying
    +Stream<bool> isCompleted
    +Stream<Duration> position
    +Stream<Duration> duration
    +Stream<double> volume
    +Stream<double> rate
    +Stream<double> pitch
    +Stream<bool> isBuffering
    +Stream<AudioParams> audioParams
    +Stream<double> audioBitrate
    +Stream<PlayerError> error
  }

  class PlayerState {
    +Playlist playlist
    +bool isPlaying
    +bool isCompleted
    +Duration position
    +Duration duration
    +double volume
    +double rate
    +double pitch
    +bool isBuffering
    +AudioParams audioParams
    +double audioBitrate
    +PlayerError error
  }

  class Player {
    +PlatformPlayer? platform

    +«get» PlayerState state
    +«get» PlayerStreams streams

    +«set» volume: double*
    +«set» rate: double*
    +«set» pitch: double*
    +«set» shuffle: bool*
    +«get» handle: Future<int>

    +open(playlist)
    +play()
    +pause()
    +playOrPause()
    +add(media)
    +remove(index)
    +next()
    +previous()
    +jump(index)
    +move(from, to)
    +seek(duration)
    +setPlaylistMode(playlistMode)
    +dispose()
  }

  class PlatformPlayer {
    +PlayerState state
    +PlayerStreams streams
    +PlayerConfiguration configuration

    +open(playlist)*
    +play()*
    +pause()*
    +playOrPause()*
    +add(media)*
    +remove(index)*
    +next()*
    +previous()*
    +jump(index)*
    +move(from, to)*
    +seek(duration)*
    +setPlaylistMode(playlistMode)*
    +dispose()*

    +«set» volume: double*
    +«set» rate: double*
    +«set» pitch: double*
    +«set» shuffle: bool*
    +«get» handle: Future<int>*

    #StreamController<Playlist> playlistController
    #StreamController<bool> isPlayingController
    #StreamController<bool> isCompletedController
    #StreamController<Duration> positionController
    #StreamController<Duration> durationController
    #StreamController<double> volumeController
    #StreamController<double> rateController
    #StreamController<double> pitchController
    #StreamController<bool> isBufferingController
    #StreamController<PlayerError> errorController
    #StreamController<AudioParams> audioParamsController
    #StreamController<double?> audioBitrateController
  }

  class libmpv_Player {
    +open(playlist)
    +play()
    +pause()
    +playOrPause()
    +add(media)
    +remove(index)
    +next()
    +previous()
    +jump(index)
    +move(from, to)
    +seek(duration)
    +setPlaylistMode(playlistMode)
    +«set» volume: double
    +«set» rate: double
    +«set» pitch: double
    +«set» shuffle: bool
    +«get» handle: Future<int>
    +dispose()
  }

  class NativeLibrary {
    +find()$ String?
  }

  class xyz_Player {
    +open(playlist)
    +play()
    +pause()
    +playOrPause()
    +add(media)
    +remove(index)
    +next()
    +previous()
    +jump(index)
    +move(from, to)
    +seek(duration)
    +setPlaylistMode(playlistMode)
    +«set» volume: double
    +«set» rate: double
    +«set» pitch: double
    +«set» shuffle: bool
    +«get» handle: Future<int>
    +dispose()
  }
```

### package:media_kit_video

_Click on the zoom button on top-right or pinch inside._

#### Windows

```mermaid
%%{
  init: {
    'themeVariables': {
      'fontFamily': 'BlinkMacSystemFont, Segoe UI, Noto Sans, Helvetica, Arial, Apple Color Emoji, Segoe UI Emoji'
    }
  }
}%%
classDiagram

  MediaKitVideoPlugin "1" *-- "1" VideoOutputManager: Create VideoOutput(s) with VideoOutputManager for handle passed through platform channel
  VideoOutputManager "1" *-- "*" VideoOutput: Takes PluginRegistrarWindows as reference
  VideoOutputManager "1" *-- "1" ThreadPool
  VideoOutput "*" o-- "1" ThreadPool: Post creation, resize & render etc. tasks involving EGL to ensure synchronous EGL/ANGLE usage across multiple VideoOutput(s)
  VideoOutput "1" *-- "1" ANGLESurfaceManager: Only for H/W accelerated rendering

  class MediaKitVideoPlugin {
    -flutter::PluginRegistrarWindows registrar_
    -std::unique_ptr<MethodChannel> channel_
    -std::unique_ptr<VideoOutputManager> video_output_manager_
    -HandleMethodCall(method_call, result);
  }

  class ThreadPool {
    +Post(function: std::function)
  }

  class VideoOutputManager {
    +Create(handle: int, width: optional<int>, height: optional<int>, texture_update_callback: std::function)
    +Dispose(handle: int)

    -std::mutex mutex_
    -std::unique_ptr<ThreadPool> thread_pool_
    -flutter::PluginRegistrarWindows registrar_
    -std::unordered_map<int64_t, std::unique_ptr<VideoOutput>> video_outputs_
  }

  class VideoOutput {
    +«get» texture_id: int64_t
    -mpv_handle* handle
    -mpv_render_context* context
    -std::optional<int64_t> width
    -std::optional<int64_t> height
    -int64_t texture_id_
    -flutter::PluginRegistrarWindows registrar_
    -ThreadPool* thread_pool_ref_
    -std::unordered_map<int64_t, std::unique_ptr<flutter::TextureVariant>> texture_variants_
    -std::unique_ptr<ANGLESurfaceManager> surface_manager_ HW
    -std::unordered_map<int64_t, std::unique_ptr<FlutterDesktopGpuSurfaceDescriptor>> textures_ HW
    -std::unique_ptr<uint8_t[]> pixel_buffer_ SW
    -std::unordered_map<int64_t, std::unique_ptr<FlutterDesktopPixelBuffer>> pixel_buffer_textures_ SW
    -std::function texture_update_callback_

    +SetTextureUpdateCallback(callback: std::function<void(int64_t, int64_t, int64_t)>)
    -Render()
    -CheckAndResize()
    -Resize(required_width: int64_t, required_height: int64_t)
    -GetVideoWidth(): int64_t
    -GetVideoHeight(): int64_t
  }

  class ANGLESurfaceManager {
    +«get» width: int32_t
    +«get» height: int32_t
    +«get» handle: HANDLE

    +HandleResize(width: int32_t, height: int32_t)
    +Draw(draw_callback: std::function<void()>)
    +Read()
    +SwapBuffers()
    +MakeCurrent(value: bool)
    -CreateEGLDisplay()
    -Initialize()
    -InitializeD3D11()
    -InitializeD3D9()
    -CleanUp(release_context: bool)
    -CreateEGLDisplay()
    -ShowFailureMessage(message: wchar_t[])

    -IDXGIAdapter* adapter_
    -int32_t width_
    -int32_t height_
    -ID3D11Device* d3d_11_device_
    -ID3D11DeviceContext* d3d_11_device_context_
    -Microsoft::WRL::ComPtr<ID3D11Texture2D>
    -Microsoft::WRL::ComPtr<IDXGISwapChain>
    -IDirect3D9Ex* d3d_9_ex_
    -IDirect3DDevice9Ex* d3d_9_device_ex_
    -IDirect3DTexture9* d3d_9_texture_
    -HANDLE handle_
    -EGLSurface surface_
    -EGLDisplay display_
    -EGLContext context_
    -EGLConfig config_
  }
```

#### Linux

```mermaid
%%{
  init: {
    'themeVariables': {
      'fontFamily': 'BlinkMacSystemFont, Segoe UI, Noto Sans, Helvetica, Arial, Apple Color Emoji, Segoe UI Emoji'
    }
  }
}%%
classDiagram

  MediaKitVideoPlugin "1" *-- "1" VideoOutputManager: Create VideoOutput(s) with VideoOutputManager for handle passed through platform channel
  VideoOutputManager "1" *-- "*" VideoOutput: Takes FlTextureRegistrar as reference
  VideoOutput "1" *-- "1" TextureGL: For H/W rendering.
  TextureGL "1" o-- "1" VideoOutput: Take VideoOutput as reference
  VideoOutput "1" *-- "1" TextureSW: For S/W rendering.
  TextureSW "1" o-- "1" VideoOutput: Take VideoOutput as reference
  TextureGL "1" <-- "1" FlTextureGL
  TextureSW "1" <-- "1" FlTexture

  class MediaKitVideoPlugin {
    -FlMethodChannel* channel
    -VideoOutputManager* video_output_manager
  }

  class VideoOutputManager {
    -GHashTable* video_outputs
    -FlTextureRegistrar* texture_registrar
    +video_output_manager_create(self: VideoOutputManager*, handle: gint64, width: gint64, height: gint64, texture_update_callback: TextureUpdateCallback, texture_update_callback_context: gpointer)
    +video_output_manager_dispose(self: VideoOutputManager*, handle: gint64)
  }

  class VideoOutput {
    -TextureGL* texture_gl
    -GdkGLContext* context_gl
    -mpv_handle* handle
    -mpv_render_context* render_context
    -gint64 width
    -gint64 height
    -TextureUpdateCallback texture_update_callback
    -gpointer texture_update_callback_context
    -FlTextureRegistrar* texture_registrar
    +video_output_set_texture_update_callback(self: VideoOutput*, texture_update_callback: TextureUpdateCallback, texture_update_callback_context: gpointer)
    +video_output_get_render_context(self: VideoOutput*): mpv_render_context*
    +video_output_get_width(self: VideoOutput*): gint64
    +video_output_get_height(self: VideoOutput*): gint64
    +video_output_get_texture_id(self: VideoOutput*): gint64
    +video_output_notify_texture_update(self: VideoOutput*);
  }

  class TextureGL {
    -guint32 name
    -guint32 fbo
    -guint32 current_width
    -guint32 current_height
    -VideoOutput* video_output
    texture_gl_populate_texture(texture: FlTextureGL*, target: guint32*, name: guint32*, width: guint32*, height: guint32*, error: GError**): gboolean
  }

  class TextureSW {
    -guint32 current_width
    -guint32 current_height
    -VideoOutput* video_output
    texture_sw_copy_pixels(texture: FlPixelBufferTexture*, buffer: const uint8_t**, width: uint32_t*, height: uint32_t*, error: GError**): gboolean
  }
```

#### macOS

_TODO: documentation_

#### iOS

_TODO: documentation_

#### Android

```mermaid
%%{
  init: {
    'themeVariables': {
      'fontFamily': 'BlinkMacSystemFont, Segoe UI, Noto Sans, Helvetica, Arial, Apple Color Emoji, Segoe UI Emoji'
    }
  }
}%%
classDiagram

  MediaKitVideoPlugin "1" *-- "1" VideoOutputManager: Create VideoOutput(s) with VideoOutputManager for handle passed through platform channel
  VideoOutputManager "1" *-- "*" VideoOutput: Create VideoOutput(s) to send back id & wid for render. Dispose to release.
  VideoOutput <.. MediaKitAndroidHelper: Create & dispose JNI global object reference to android.view.Surface (for --wid)
  MediaKitVideoPlugin <.. MPVLib: Initialize libmpv for usage on Android. Taken from mpv for Android.
  
  class MediaKitVideoPlugin {
    -MethodChannel channel
    -VideoOutputManager videoOutputManager
  }
  
  class VideoOutputManager {
    -HashMap<Long, VideoOutput> videoOutputs
    -TextureRegistry textureRegistryReference
    -Object lock
    
    +create(long handle): VideoOutput
    +dispose(long handle): void
  }
  
  class VideoOutput {
    -Surface surface
    -TextureRegistry.SurfaceTextureEntry surfaceTextureEntry
    
    +long id
    +long wid
    
    +dispose()
  }
  
  class MediaKitAndroidHelper {
    +newGlobalObjectRef(obj: Object): long
    +deleteGlobalObjectRef(ref: long): void
    +setApplicationContext(context: Context): void
    +copyAssetToExternalFilesDir(assetName: String): String
  }
  
  class MPVLib {
    +create(context: Context): context
  }
  
```

## Implementation

[libmpv](https://github.com/mpv-player/mpv/tree/master/libmpv) is used for leveraging audio & video playback.  It _seems_ the best possible option since supports a wide variety of audio & video formats, provides hardware acceleration & bundle size is also minimal (select only required decoders etc. in FFmpeg/mpv).

Another major advantage is that large part of implementation (80%+) is shared across platforms using FFI. This makes the behavior of package very-very similar on all supported platforms & makes maintenance easier (since there is less code & most of it within Dart).

Alternative backends may be implemented in future to meet certain demands (& project architecture makes it possible).

### package:media_kit

[package:media_kit](https://github.com/alexmercerind/media_kit) is entirely written in Dart. It uses dart:ffi to invoke native C API of libmpv through it's shared libraries. All the callback management, event-`Stream`s, other methods to control playback of audio/video are implemented in Dart with the help of FFI. Event management i.e. `position`, `duration`, `bitrate`, `audioParams` `Stream`s are important to render changes in the UI.

A [big limitation with FFI in Dart SDK](https://github.com/dart-lang/sdk/issues/37022) has been that it does not support async callbacks from another thread. Learn more about this at: [dart/sdk#37022](https://github.com/dart-lang/sdk/issues/37022). Following situation will explain better:

> If you pass a function pointer from Dart to C code, you can invoke it fine. But, as soon as you invoke it from some other thread on the native side, Dart VM will instantly crash. This feature is important because most events take place on a background thread.

However, I could easily do this within Dart because [libmpv](https://github.com/mpv-player/mpv/tree/master/libmpv) offers an "event polling"-like way to listen to events. I got awesome idea to spawn a background [`Isolate`](https://api.flutter.dev/flutter/dart-isolate/Isolate-class.html), where I run the event-loop. I get the memory address of each event and forward it outside the [`Isolate`](https://api.flutter.dev/flutter/dart-isolate/Isolate-class.html) with the help of [`ReceivePort`](https://api.dart.dev/stable/2.18.6/dart-isolate/ReceivePort-class.html), where I finally interpret it using more FFI code. I have explained this in detail within [the in-code comments of initializer.dart, where I had to perform a lot more trickery to get this to work](https://github.com/alexmercerind/media_kit/blob/master/media_kit/lib/src/libmpv/core/initializer.dart).

**Thus, invoking native methods & handling of events etc. could be done within 100% Dart using FFI.** This is enough for audio playback & supports both Flutter SDK & Dart VM. Although event handling works entirely within Dart. Later, it was discovered that going beyond certain number of simultaneous instances caused a deadlock ([dart-lang/sdk#51254](https://github.com/dart-lang/sdk/issues/51254) & [dart-lang/sdk#51261](https://github.com/dart-lang/sdk/issues/51261)), making UI entirely freezed along-side any other Dart code in execution. To deal with this, a new package [package:media_kit_native_event_loop](#packagemedia_kit_native_event_loop) is created. Adding [package:media_kit_native_event_loop](#packagemedia_kit_native_event_loop) to `pubspec.yaml` automatically resolves this issue without any chagnes to code!

However, no such "event-polling" like API is possible for video rendering. So, I best idea seemed to create a new package [`package:media_kit_video`](https://github.com/alexmercerind/media_kit) for specifically offering platform-specific video embedding implementation which internally handles Flutter's Texture Registry API & libmpv's OpenGL rendering API. This package only consumes the `mpv_handle*` (which can be shared as primitive `int` value easily) of the instance (created with [package:media_kit](https://github.com/alexmercerind/media_kit) through FFI) to setup a new viewport. Detailed implementation is discussed below.

### package:media_kit_native_event_loop

> Platform specific threaded event handling for media_kit. Enables support for higher number of concurrent instances.

The package contains a minimal C++ implementation which spawns a detach-ed [`std::thread`](https://en.cppreference.com/w/cpp/thread/thread). This runs the `mpv_wait_event` loop & forwads the events using [`postCObject`](https://api.dart.dev/stable/2.19.6/dart-ffi/NativeApi/postCObject.html), [`SendPort`](https://api.dart.dev/stable/2.19.6/dart-isolate/SendPort-class.html) & [`ReceivePort`](https://api.dart.dev/stable/2.19.6/dart-isolate/ReceivePort-class.html) to Dart VM. Necessary mutex synchronization also takes place.

[`Isolate`](https://api.flutter.dev/flutter/dart-isolate/Isolate-class.html) based event loop is avoided once this package is added to the project.

### package:media_kit_video

#### Windows

- [libmpv](https://github.com/mpv-player/mpv/tree/master/libmpv) gives access to C API for rendering hardware-accelerated video output using OpenGL.
  - See:
    - [render.h](https://github.com/mpv-player/mpv/blob/master/libmpv/render.h)
    - [render_gl.h](https://github.com/mpv-player/mpv/blob/master/libmpv/render_gl.h)
- Flutter recently added ability for Windows to [render Direct3D `ID3D11Texture2D` textures](https://github.com/flutter/engine/pull/26840).

The two APIs above are hardware accelerated i.e. GPU backed buffers are used. **This is performant approach, easily capable for rendering 4K 60 FPS videos**, rest depends on the hardware. Since [libmpv](https://github.com/mpv-player/mpv/tree/master/libmpv) API is OpenGL based & the Texture API in Flutter is Direct3D based, [ANGLE (Almost Native Graphics Layer Engine)](https://github.com/google/angle) is used for interop, which translates the OpenGL ES 2.0 calls into Direct3D.

This hardware accelerated video output requires DirectX 11 or higher. Most Windows systems with either integrated or discrete GPUs should support this already. On systems where Direct3D fails to load due to missing graphics drivers or unsupported feature-level or DirectX version etc. a fallback pixel-buffer based software renderer is used. This means that video is rendered by CPU & every frame is copied back to the RAM. This will cause some redundant load on the CPU, result in decreased battery life & may not play higher resolution videos properly. However, it works well.

<details>

<summary> Windows 7 & 8.x also work correctly. </summary>

![0](https://user-images.githubusercontent.com/28951144/212947036-4a2430d6-729e-47d7-a356-c8cc8534a1aa.jpg)
![1](https://user-images.githubusercontent.com/28951144/212947046-cc8d441c-96f8-4437-9f59-b4613ca73f2a.jpg)

</details>

You can visit my [experimentation repository](https://github.com/alexmercerind/flutter-windows-ANGLE-OpenGL-Direct3D-Interop) to see a minimal example showing OpenGL ES usage in Flutter Windows.

#### Linux

On Flutter Linux, [both OpenGL (H/W) & pixel buffer (S/W) APIs](https://github.com/flutter/engine/pull/24916) are available for rendering on [`Texture` widget](https://api.flutter.dev/flutter/widgets/Texture-class.html).

#### macOS

On macOS the current implementation is based on [libmpv](https://github.com/mpv-player/mpv/tree/master/libmpv) and can be summarized as follows:
1. H/W video decoding: mpv option `hwdec` is set to `auto`, does not depend on a pixel buffer.
2. OpenGL rendering to an OpenGL texture backed by a pixel buffer, which makes it interoperable with METAL ([CVPixelBuffer](https://developer.apple.com/documentation/corevideo/cvpixelbuffer-q2e))

<!--

Possible improvements :
- Render directly to METAL texture:
  - Use ANGLE to not depend on the host OpenGL implementation, deprecated by Apple.
  - Use a future METAL API natively developed by mpv.
- Share the METAL texture between `media_kit_video` and Flutter, without using a pixel buffer.

-->

#### iOS

iOS shares much of it's implementation with macOS. Only difference is that OpenGL ES is used instead of OpenGL.

#### Android

On Android, [texture registry API](https://api.flutter.dev/javadoc/io/flutter/view/TextureRegistry.html) is based on [`android.graphics.SurfaceTexture`](https://developer.android.com/reference/android/graphics/SurfaceTexture.html?is-external=true).

[libmpv](https://github.com/mpv-player/mpv/tree/master/libmpv) can render directly onto an [`android.view.Surface`](https://developer.android.com/reference/android/view/Surface) after setting [`--wid`](https://mpv.io/manual/stable/#options-wid). Creation of a new [`android.view.Surface`](https://developer.android.com/reference/android/view/Surface) requires reference to an existing [`android.graphics.SurfaceTexture`](https://developer.android.com/reference/android/graphics/SurfaceTexture.html?is-external=true), [which can be consumed from the texture entry created by Flutter itself](https://api.flutter.dev/javadoc/io/flutter/view/TextureRegistry.SurfaceTextureEntry.html#surfaceTexture()).

This requires `--hwdec=mediacodec` for hardware decoding, along with `--vo=mediacodec_embed` and `--wid=(intptr_t)(*android.view.Surface)`.

More details may be found at: https://mpv.io/manual/stable/#video-output-drivers-mediacodec-embed

Obtaining a global reference pointer to a Java object ([`android.view.Surface`](https://developer.android.com/reference/android/view/Surface) in our case) requires JNI. For this, a custom shared library is used, you can find it's implementation at [media-kit/media-kit-android-helper](https://github.com/media-kit/media-kit-android-helper). Since compilation of this would require NDK (& make process tedious), pre-built shared libraries is bundled for each architecture at the time of development/build.

Since the `package:media_kit` is a Dart package (which works independent of Flutter), accessing assets was a challenging part. The mentioned shared libraries generated by [media-kit/media-kit-android-helper](https://github.com/media-kit/media-kit-android-helper) helps to [access assets bundled inside Android APK from Dart](https://github.com/alexmercerind/MediaKitAndroidHelper/blob/220cf95958aceb7e3678ba524da812f212524537/app/src/main/cpp/native-lib.cpp#L26-L115) (using FFI, without depending on Flutter).

## License

Copyright © 2021 & onwards, Hitesh Kumar Saini <<saini123hitesh@gmail.com>>

This project & the work under this repository is governed by MIT license that can be found in the [LICENSE](./LICENSE) file.
