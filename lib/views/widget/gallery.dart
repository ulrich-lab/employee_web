// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:photo_manager/photo_manager.dart';
// import 'package:visitor_pass/Controllers/chat_controller.dart';
// import 'package:visitor_pass/theme/color_theme.dart';
// import 'package:visitor_pass/theme/theme.dart';
// import 'package:visitor_pass/views/widget/attachment_sender.dart';
// import 'package:visitor_pass/config/locator/locator.dart';

// class Gallery extends StatefulWidget {
//   const Gallery({super.key, required this.title, this.returnFiles = false});

//   final String title;
//   final bool returnFiles;

//   @override
//   State<Gallery> createState() => _GalleryState();
// }

// class _GalleryState extends State<Gallery>
//     with WidgetsBindingObserver, SingleTickerProviderStateMixin {
//   late final TabController _tabController;
//   late final Stream<List<AlbumWrapper>> _albumsFuture;
//   GalleryController galleryController = Get.put(GalleryController());

//   @override
//   void initState() {
//     _albumsFuture = loadAlbums();
//     galleryController.init(returnFiles: widget.returnFiles);

//     WidgetsBinding.instance.addObserver(this);
//     _tabController = TabController(
//       length: 2,
//       vsync: this,
//       initialIndex: 1,
//     )..addListener(_tabListener);
//     super.initState();
//   }

//   Stream<List<AlbumWrapper>> loadAlbums() async* {
//     final albums = await PhotoManager.getAssetPathList(
//       hasAll: true,
//       type: widget.returnFiles ? RequestType.image : RequestType.common,
//     );

//     final albumWrappers = <AlbumWrapper>[];

//     for (final album in albums) {
//       final assets = await album.getAssetListRange(start: 0, end: 1);
//       if (assets.isEmpty) continue;

//       final assetCount = await album.assetCountAsync;
//       final thumbnail = assets.first.thumbnailDataWithSize(
//         const ThumbnailSize.square(200),
//         quality: 100,
//       );

//       final albumWrapper = AlbumWrapper(
//         album: album,
//         assetCount: assetCount,
//         thumbnail: thumbnail,
//       );

//       albumWrappers.add(albumWrapper);
//       yield albumWrappers;
//     }
//   }

//   void _tabListener() {
//     if (widget.returnFiles) return;

//     galleryController
//         .setSelectBtnVisibility(_tabController.index == 0 ? true : false);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _tabController.removeListener(_tabListener);
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorTheme = Theme.of(context).custom.colorTheme;
//     final backgroundColor = Theme.of(context).brightness == Brightness.dark
//         ? AppColorsDark.backgroundColor
//         : const Color.fromARGB(221, 255, 255, 255);
//     final brightness = Theme.of(context).brightness;
//     final systemOverlayStyle = brightness == Brightness.light
//         ? const SystemUiOverlayStyle(
//             statusBarColor: Color.fromARGB(172, 231, 231, 231),
//             statusBarIconBrightness: Brightness.dark,
//           )
//         : const SystemUiOverlayStyle(
//             statusBarColor: AppColorsDark.backgroundColor,
//             statusBarIconBrightness: Brightness.light,
//           );

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(100),
//         child: StatefulBuilder(
//           builder: (context, _) {
//             final canSelect = galleryController.state.value.canSelect;
//             final selectedCount =
//                 galleryController.state.value.selectedAssets.length;
//             final showSelectBtn = galleryController.state.value.showSelectBtn &&
//                 !widget.returnFiles;

//             return AppBar(
//               systemOverlayStyle: systemOverlayStyle,
//               elevation: 0,
//               backgroundColor: backgroundColor,
//               leading: IconButton(
//                 onPressed: () {
//                   if (canSelect) {
//                     galleryController.toggleCanSelect();
//                     return;
//                   }

//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back,
//                   color: AppColorsDark.iconColor,
//                 ),
//               ),
//               title: SizedBox(
//                 width: 0.6.sw,
//                 child: Text(
//                   canSelect
//                       ? selectedCount == 0
//                           ? 'Tap a photo to select'
//                           : '$selectedCount selected'
//                       : widget.title,
//                   style: TextStyle(color: colorTheme.textColor1),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               actions: [
//                 if (!canSelect && showSelectBtn)
//                   IconButton(
//                     onPressed: galleryController.toggleCanSelect,
//                     icon: const Icon(
//                       Icons.check_box_outlined,
//                       color: AppColorsDark.iconColor,
//                     ),
//                   )
//               ],
//               bottom: PreferredSize(
//                 preferredSize: const Size.fromHeight(50),
//                 child: Container(
//                   color: Theme.of(context).brightness == Brightness.dark
//                       ? colorTheme.appBarColor
//                       : backgroundColor,
//                   child: TabBar(
//                     labelColor: colorTheme.textColor1,
//                     indicatorColor: AppColorsDark.indicatorColor,
//                     controller: _tabController,
//                     physics: const BouncingScrollPhysics(),
//                     tabs: const [
//                       Tab(text: 'Recents'),
//                       Tab(text: 'Albums'),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       body: DefaultTabController(
//         length: 2,
//         child: StreamBuilder(
//           stream: _albumsFuture,
//           builder: (context, snap) {
//             if (!snap.hasData) {
//               return Container();
//             }

//             AlbumWrapper? recentAlbum;
//             try {
//               recentAlbum = snap.data!.firstWhere(
//                 (element) => element.album.isAll,
//               );
//             } on StateError {
//               recentAlbum = null;
//             }

//             return Padding(
//               padding: const EdgeInsets.only(top: 2.0),
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   Recents(recentAlbum: recentAlbum),
//                   AlbumsTab(albums: snap.data!),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class Recents extends StatefulWidget {
//   const Recents({
//     super.key,
//     required this.recentAlbum,
//   });

//   final AlbumWrapper? recentAlbum;

//   @override
//   State<Recents> createState() => _RecentsState();
// }

// class _RecentsState extends State<Recents> with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return AlbumView(
//       showAlbumName: false,
//       album: widget.recentAlbum?.album,
//       albumTitle: 'Recents',
//     );
//   }
// }

// class AlbumsTab extends StatelessWidget {
//   const AlbumsTab({super.key, required this.albums});
//   final List<AlbumWrapper> albums;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       physics: const BouncingScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 4,
//         crossAxisSpacing: 4,
//       ),
//       itemCount: albums.length,
//       itemBuilder: (context, index) {
//         return AlbumCard(
//           album: albums[index].album,
//           thumbnail: albums[index].thumbnail,
//           assetCount: albums[index].assetCount,
//         );
//       },
//     );
//   }
// }

// class AlbumCard extends StatelessWidget {
//   const AlbumCard({
//     super.key,
//     required this.album,
//     required this.assetCount,
//     required this.thumbnail,
//   });

//   final AssetPathEntity album;
//   final int assetCount;
//   final Future<Uint8List?> thumbnail;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () async {
//         if (!context.mounted) return;
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => AlbumView(
//               albumTitle: album.name,
//               album: album,
//             ),
//           ),
//         );
//       },
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           FadeInThumbnail(thumbnail: thumbnail),
//           Container(
//             height: 50,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(12), topRight: Radius.circular(12)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromARGB(87, 0, 0, 0),
//                   blurRadius: 24,
//                 ),
//               ],
//               gradient: LinearGradient(
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,
//                 colors: [Color.fromARGB(145, 0, 0, 0), Colors.transparent],
//                 stops: [0.0, 1.0],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 8.0,
//               vertical: 8.0,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Icon(
//                   Icons.folder,
//                   color: Colors.white,
//                   size: 18,
//                 ),
//                 const SizedBox(width: 8.0),
//                 Expanded(
//                   child: Text(
//                     album.name,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   assetCount.toString(),
//                   style: const TextStyle(color: Colors.white),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AlbumView extends StatefulWidget {
//   const AlbumView({
//     super.key,
//     required this.album,
//     this.showAlbumName = true,
//     this.albumTitle,
//   });

//   final bool showAlbumName;
//   final AssetPathEntity? album;
//   final String? albumTitle;

//   @override
//   State<AlbumView> createState() => _AlbumViewState();
// }

// class _AlbumViewState extends State<AlbumView> {
//   late final Future<void> _assetsFuture;
//   final List<AssetWrapper> _assets = [];
//   final assetsPerPage = 40;
//   final _scrollController = ScrollController(keepScrollOffset: true);
//   int page = 0;
//   bool isLoading = true;
//   GalleryController galleryController = Get.put(GalleryController());

//   @override
//   void initState() {
//     if (widget.album != null) {
//       _assetsFuture = loadAssetsPaged(page);
//     }

//     _scrollController.addListener(_scrollListener);
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant AlbumView oldWidget) {
//     if (oldWidget.album == null && widget.album != null) {
//       _assetsFuture = loadAssetsPaged(page);
//     }

//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_scrollListener);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   Future<void> loadAssetsPaged(int pageNo) async {
//     final assetsForPage = await widget.album!.getAssetListPaged(
//       page: pageNo,
//       size: assetsPerPage,
//     );

//     final thumbnails = assetsForPage
//         .map(
//           (e) => e
//               .thumbnailDataWithSize(
//                 const ThumbnailSize.square(300),
//                 quality: 100,
//               )
//               .onError((_, __) => null),
//         )
//         .toList();

//     for (var i = 0; i < assetsForPage.length; i++) {
//       final asset = assetsForPage[i];
//       _assets.add(
//         AssetWrapper(asset: asset, thumbnail: thumbnails[i]),
//       );
//     }

//     setState(() {
//       page = pageNo;
//       isLoading = false;
//     });
//   }

//   void _scrollListener() {
//     if (isLoading) return;
//     if (_scrollController.position.maxScrollExtent - _scrollController.offset <
//         600) {
//       setState(() => isLoading = true);
//       loadAssetsPaged(page + 1);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final selectedAssets = galleryController.state.value.selectedAssets;
//     final showSelectedAssets = selectedAssets.isNotEmpty;
//     final canSelect = galleryController.state.value.canSelect;
//     final colorTheme = Theme.of(context).custom.colorTheme;
//     final backgroundColor = Theme.of(context).brightness == Brightness.dark
//         ? AppColorsDark.backgroundColor
//         : const Color.fromARGB(221, 255, 255, 255);
//     final brightness = Theme.of(context).brightness;
//     final systemOverlayStyle = brightness == Brightness.light
//         ? const SystemUiOverlayStyle(
//             statusBarColor: Color.fromARGB(172, 231, 231, 231),
//             statusBarIconBrightness: Brightness.dark,
//           )
//         : const SystemUiOverlayStyle(
//             statusBarColor: AppColorsDark.backgroundColor,
//             statusBarIconBrightness: Brightness.light,
//           );

//     return Scaffold(
//       appBar: !widget.showAlbumName
//           ? null
//           : AppBar(
//               systemOverlayStyle: systemOverlayStyle,
//               elevation: 0,
//               backgroundColor: backgroundColor,
//               leading: IconButton(
//                 onPressed: () {
//                   if (canSelect) {
//                     galleryController.toggleCanSelect();
//                     return;
//                   }

//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back,
//                   color: AppColorsDark.unselectedLabelColor,
//                 ),
//               ),
//               title: Text(
//                 canSelect
//                     ? selectedAssets.isEmpty
//                         ? 'Tap a photo to select'
//                         : "${selectedAssets.length} selected"
//                     : widget.albumTitle ?? '',
//                 style: TextStyle(color: colorTheme.textColor1),
//               ),
//               actions: [
//                 if (!canSelect && !galleryController.shouldReturnFiles!)
//                   IconButton(
//                     onPressed: galleryController.toggleCanSelect,
//                     icon: const Icon(
//                       Icons.check_box_outlined,
//                       color: AppColorsDark.unselectedLabelColor,
//                     ),
//                   )
//               ],
//             ),
//       backgroundColor: colorTheme.backgroundColor,
//       body: PopScope(
//         canPop: false,
//         onPopInvoked: (didPop) {
//           if (canSelect) {
//             galleryController.toggleCanSelect();
//             return;
//           }

//           if (!didPop) {
//             Navigator.pop(context);
//           }
//         },
//         child: SafeArea(
//           child: Column(
//             children: [
//               widget.album != null
//                   ? FutureBuilder(
//                       future: _assetsFuture,
//                       builder: (context, snap) {
//                         if (snap.connectionState == ConnectionState.waiting) {
//                           return Container();
//                         }

//                         return Expanded(
//                           child: GridView.builder(
//                             physics: const BouncingScrollPhysics(),
//                             controller: _scrollController,
//                             shrinkWrap: true,
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                               mainAxisSpacing: 2,
//                               crossAxisSpacing: 2,
//                             ),
//                             itemCount: _assets.length,
//                             itemBuilder: (context, index) {
//                               if (index >= _assets.length) {
//                                 return Container(
//                                   color: Theme.of(context).brightness ==
//                                           Brightness.dark
//                                       ? AppColorsDark.appBarColor
//                                       : const Color.fromARGB(
//                                           172, 231, 231, 231),
//                                   width: double.infinity,
//                                   height: double.infinity,
//                                 );
//                               }
//                               return AlbumItem(
//                                 assetWrapper: _assets[index],
//                               );
//                             },
//                           ),
//                         );
//                       },
//                     )
//                   : Container(),
//               if (showSelectedAssets)
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     color: Theme.of(context).custom.colorTheme.appBarColor,
//                     height: 60,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: selectedAssets.length,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 key: ValueKey(selectedAssets[index].asset.id),
//                                 padding: const EdgeInsets.only(right: 10.0),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(4),
//                                   child: SizedBox(
//                                     width: 40,
//                                     height: 40,
//                                     child: FadeInThumbnail(
//                                       thumbnail:
//                                           selectedAssets[index].thumbnail,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () => galleryController.prepareAttachments(
//                             context,
//                             selectedAssets,
//                             mounted,
//                           ),
//                           child: CircleAvatar(
//                             radius: 24,
//                             backgroundColor:
//                                 Theme.of(context).custom.colorTheme.greenColor,
//                             child: const Icon(
//                               Icons.check,
//                               color: Colors.white,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AlbumItem extends StatefulWidget {
//   AlbumItem({
//     super.key,
//     required this.assetWrapper,
//   });

//   final AssetWrapper assetWrapper;

//   @override
//   State<AlbumItem> createState() => _AlbumItemState();
// }

// class _AlbumItemState extends State<AlbumItem> {
//   GalleryController galleryController = Get.put(GalleryController());

//   @override
//   Widget build(BuildContext context) {
//     final selected = galleryController.state.value.selectedAssets;
//     final isSelected = selected
//         .where(
//           (element) => element.asset.id == widget.assetWrapper.asset.id,
//         )
//         .isNotEmpty;

//     return InkWell(
//       onTap: () {
//         if (!galleryController.state.value.canSelect) {
//           galleryController.prepareAttachments(
//               context, [widget.assetWrapper], mounted);
//           return;
//         }

//         if (isSelected) {
//           galleryController.unselectAsset(widget.assetWrapper);
//           return;
//         }

//         galleryController.selectAsset(widget.assetWrapper);
//       },
//       child: Stack(
//         children: [
//           FadeInThumbnail(
//             thumbnail: widget.assetWrapper.thumbnail,
//             heroTag: widget.assetWrapper.asset.id,
//           ),
//           if (isSelected) ...[
//             Container(
//               width: double.infinity,
//               height: double.infinity,
//               color: Colors.black12,
//               child: const Icon(
//                 Icons.check,
//                 color: Colors.white,
//                 size: 32,
//               ),
//             )
//           ],
//         ],
//       ),
//     );
//   }
// }

// class FadeInThumbnail extends StatefulWidget {
//   const FadeInThumbnail({
//     super.key,
//     required this.thumbnail,
//     this.heroTag,
//   });

//   final Future<Uint8List?> thumbnail;
//   final String? heroTag;

//   @override
//   State<FadeInThumbnail> createState() => _FadeInThumbnailState();
// }

// class _FadeInThumbnailState extends State<FadeInThumbnail> {
//   double opacity = 0;
//   late final Future<Uint8List?> assetFuture = loadAssetThumbnail();

//   @override
//   void initState() {
//     Future.delayed(const Duration(milliseconds: 50), () {
//       if (!mounted) return;
//       setState(() {
//         opacity = 1;
//       });
//     });

//     super.initState();
//   }

//   Future<Uint8List?> loadAssetThumbnail() async {
//     return await widget.thumbnail;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: assetFuture,
//         builder: (context, snap) {
//           Image? image;
//           if (snap.data != null) {
//             image = Image.memory(
//               snap.data!,
//               width: double.infinity,
//               height: double.infinity,
//               fit: BoxFit.cover,
//             );
//           }

//           return Container(
//             color: Theme.of(context).brightness == Brightness.dark
//                 ? AppColorsDark.appBarColor
//                 : const Color.fromARGB(172, 231, 231, 231),
//             width: double.infinity,
//             height: double.infinity,
//             child: AnimatedOpacity(
//               opacity: opacity,
//               duration: const Duration(milliseconds: 300),
//               child: image == null
//                   ? Container()
//                   : widget.heroTag != null
//                       ? Hero(
//                           tag: widget.heroTag!,
//                           child: image,
//                         )
//                       : image,
//             ),
//           );
//         });
//   }
// }

// class GalleryState {
//   final String title;
//   final bool showSelectBtn;
//   final bool canSelect;
//   final List<AssetWrapper> selectedAssets;

//   GalleryState({
//     required this.title,
//     required this.selectedAssets,
//     required this.canSelect,
//     required this.showSelectBtn,
//   });

//   GalleryState copyWith({
//     String? title,
//     List<AssetWrapper>? selectedAssets,
//     bool? showSelectBtn,
//     bool? canSelect,
//   }) {
//     return GalleryState(
//       title: title ?? this.title,
//       selectedAssets: selectedAssets ?? this.selectedAssets,
//       showSelectBtn: showSelectBtn ?? this.showSelectBtn,
//       canSelect: canSelect ?? this.canSelect,
//     );
//   }
// }

// class GalleryController extends GetxController {
//   ChatController chatController = Get.put(locator<ChatController>());
//   final Rx<GalleryState> state = GalleryState(
//     title: 'Send to Suhaib',
//     selectedAssets: [],
//     showSelectBtn: false,
//     canSelect: false,
//   ).obs;

//     bool? shouldReturnFiles;

//   void init({required bool returnFiles}) {
//     shouldReturnFiles = returnFiles;
//   }

//   void setSelectBtnVisibility(bool val) {
//     state.value = state.value.copyWith(showSelectBtn: val);
//   }

//   void toggleCanSelect() {
//     state.value = state.value.copyWith(
//       canSelect: !state.value.canSelect,
//       selectedAssets: state.value.canSelect == true ? [] : null,
//     );
//   }

//   void selectAsset(AssetWrapper asset) {
//     state.value = state.value.copyWith(selectedAssets: [
//       ...state.value.selectedAssets,
//       asset,
//     ]);
//   }

//   void unselectAsset(AssetWrapper asset) {
//     state.value = state.value.copyWith(selectedAssets: [
//       ...state.value.selectedAssets.where((id) => id != asset)
//     ]);
//   }

//   Future<void> prepareAttachments(
//     BuildContext context,
//     List<AssetWrapper> selectedAssets,
//     mounted,
//   ) async {
//     final files = await Future.wait(
//       selectedAssets.map(
//         (e) => e.asset.file.then((value) => value!),
//       ),
//     );

//     final attachments = chatController.createAttachmentsFromFiles(files);

//     if (!mounted) return;
//     if (shouldReturnFiles!) {
//       Navigator.popUntil(
//         context,
//         (route) => route.settings.name == "/gallery",
//       );
//       Navigator.pop(context, files.first);
//       return;
//     }

//     final returnedAttachments = await Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => AttachmentMessageSender(
//           attachmentsFuture: attachments,
//           tags: selectedAssets.map((e) => e.asset.id).toList(),
//         ),
//       ),
//     );

//     if (returnedAttachments == null) return;
//     final newSelectedAssets = <AssetWrapper>[];
//     final awaitedAttachments = await attachments;

//     for (var i = 0; i < awaitedAttachments.length; i++) {
//       if (returnedAttachments.contains(awaitedAttachments[i])) {
//         newSelectedAssets.add(selectedAssets[i]);
//       }
//     }

//     state.value = state.value.copyWith(
//       selectedAssets: newSelectedAssets,
//       showSelectBtn:
//           newSelectedAssets.isEmpty ? state.value.showSelectBtn : false,
//       canSelect: newSelectedAssets.isEmpty ? state.value.canSelect : true,
//     );
//   }
// }

// class AssetWrapper {
//   const AssetWrapper({required this.asset, required this.thumbnail});

//   final AssetEntity asset;
//   final Future<Uint8List?> thumbnail;
// }

// class AlbumWrapper {
//   const AlbumWrapper({
//     required this.album,
//     required this.assetCount,
//     required this.thumbnail,
//   });

//   final AssetPathEntity album;
//   final int assetCount;
//   final Future<Uint8List?> thumbnail;
// }
