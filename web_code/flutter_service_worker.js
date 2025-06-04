'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "33b92a149df94113f804939d895aa05a",
"assets/AssetManifest.bin.json": "6b9167d7f7a8c30bfb253bb33286b0c6",
"assets/AssetManifest.json": "dd5e95f96b30de1ae9962ac8f69d648a",
"assets/assets/icons/address.svg": "af28ac20a9c45dfb2f9b24144c07e915",
"assets/assets/icons/appointment.svg": "3c1ede4606f39b0daf883645ef34ef27",
"assets/assets/icons/back.svg": "ba897b080dc123f8b81fc48b0d63759f",
"assets/assets/icons/bell.svg": "175d4b58f143d9ddd7716a7b0e22e926",
"assets/assets/icons/card.svg": "f69c7c2439c7f9ce2fe49bdd88e371b9",
"assets/assets/icons/card_active.svg": "3cff5a08aed711043b8ecdea74405564",
"assets/assets/icons/clock.svg": "42615d1fd84192b35d28ae1599819ba7",
"assets/assets/icons/company.svg": "e0816e216e1c1ded4fbd6740e3c04a78",
"assets/assets/icons/date.svg": "cf1d337da642cb8ae95015e8b2a41ddc",
"assets/assets/icons/delete.svg": "493e72216fe0c2cff9661a7f096f7c9b",
"assets/assets/icons/document.svg": "c17be404b594691e3ea15b91bf0083ab",
"assets/assets/icons/document_active.svg": "d71dc32a0b809facc93acad105c6f88f",
"assets/assets/icons/down.svg": "46576d7a56783b71f1cb3e4ada8d07a7",
"assets/assets/icons/edit.svg": "3b7768419cf21f2c7ab2471541db9951",
"assets/assets/icons/email.svg": "4f139c7abf66103434d7d02bcc06782c",
"assets/assets/icons/employee.svg": "84b72d84d57efec514ff89091d9edf86",
"assets/assets/icons/end_calendar.svg": "4ab22d089717a23177b87dded9fe72ba",
"assets/assets/icons/eye.svg": "539dda84f6e96da366a467697d3ed649",
"assets/assets/icons/gallery.svg": "cda4041ef5e8758d31addecddc01ed2f",
"assets/assets/icons/gender.svg": "013faa23a2cc10d62fa1730026e36b33",
"assets/assets/icons/hide.svg": "f0db8dfa7dc225df19518f3f12fc878a",
"assets/assets/icons/home.svg": "fbfc5081917efe4b8313a0ce5e6d0886",
"assets/assets/icons/home_active.svg": "a87b18dff1de5f36ec5f81c9aad77d89",
"assets/assets/icons/location_tick.svg": "09668e2a081191b825f2bde84f930567",
"assets/assets/icons/login.svg": "652b5638a06be7cfa6cdfa69add7ec5c",
"assets/assets/icons/logo.svg": "5a75904d9c7e856242191d8158febb9c",
"assets/assets/icons/logout.svg": "fc516c763777a7baafa1812f68fd585b",
"assets/assets/icons/menu.svg": "34b2c4ed061908cb89d2ab5acb7ea85d",
"assets/assets/icons/menu_active.svg": "620756bfa8f2731bdc3b50f96f18db52",
"assets/assets/icons/menu_call.svg": "c01efa076f531aa277f6cbfa1e4f9440",
"assets/assets/icons/menu_card.svg": "3c79cd5889ff35378fc691425e511e85",
"assets/assets/icons/menu_edit.svg": "45bdaaeadc932245d2ed5b4a031b32b0",
"assets/assets/icons/menu_key.svg": "0de98e8dca8cfa03fa7959fba76b5147",
"assets/assets/icons/menu_location.svg": "934f1f0ac5fa02929e62bfa3d8d0836f",
"assets/assets/icons/menu_logout.svg": "119c750478dde9b40cd407b94824f06e",
"assets/assets/icons/menu_sms.svg": "ac5e1df8ad3bfbffc47567583fa9a740",
"assets/assets/icons/message.svg": "433dab81788f868fc92a263b9c0ad253",
"assets/assets/icons/name.svg": "abb1ee3893bef81a55c08559b426c4e5",
"assets/assets/icons/people.svg": "603bfa5d6db7c80239a97c6d0da78452",
"assets/assets/icons/people_2.svg": "aa499040873e67fe78e44f433f4157ab",
"assets/assets/icons/permission.svg": "a6197ac3426e891e10f8bdd88ec43ec0",
"assets/assets/icons/phone.json": "687387c37f598c7af2bdd0a55eb47888",
"assets/assets/icons/phone.svg": "12ba545e583af07c4b0bdef3e8138e70",
"assets/assets/icons/profile.svg": "ec65f4f5ba4ac80672ffe4a62f853522",
"assets/assets/icons/purpose.svg": "1a9c41b291cef5ad508a047d2e2057f3",
"assets/assets/icons/qrcode.svg": "06e8d2686446ce52d78201b13f7477a3",
"assets/assets/icons/right.svg": "b29b36009eea653112a08438c0da996c",
"assets/assets/icons/search.svg": "8ab6a48ef6fbdc78f0a871f9ef37e22c",
"assets/assets/icons/start_calendar.svg": "4df63aced28171b81e6890300a9ef4d4",
"assets/assets/icons/status.svg": "615e16075b5d518c8c26ad2480634565",
"assets/assets/icons/type_icon.svg": "5f158ecacd3816b839e60964c5e563ff",
"assets/assets/icons/user.svg": "ed0d284f12681258792dc934309eaaf1",
"assets/assets/icons/user_active.svg": "961ff957b68c6303751431b2c574fc36",
"assets/assets/images/address.png": "7f6f5c1807e8110eb2d0f4a6acfde956",
"assets/assets/images/airdrop.png": "6fc29212b8defab0ac3e260a34eb5504",
"assets/assets/images/avatar.png": "e1ddc6447b96e096232dd00aa1394787",
"assets/assets/images/back.png": "1aff9320bff155ffdc8c30b1ba10f44a",
"assets/assets/images/bell.png": "d3082c85208c127216877f2e3cbc6ae7",
"assets/assets/images/bio.png": "72c55436f21573ee87cfb6ad9da27328",
"assets/assets/images/calendar.png": "11e1ae0cc3617fa8e0706b2e7581d9c9",
"assets/assets/images/call.png": "d5a865853bc60af50b7ba6a240786033",
"assets/assets/images/call1.png": "7ac3e1c46cbf28c8bdb494db72816ba9",
"assets/assets/images/chat_bg.png": "e283fafe0fa5c5e2dff1d145396fb9cb",
"assets/assets/images/clock.png": "e96e9aa6d014d0b5f075410e22ef7b2d",
"assets/assets/images/company.png": "78f6cfe033723aa789a3969c59f9c15e",
"assets/assets/images/curve.png": "669a49f3935c3d08af7017fed0ba5d62",
"assets/assets/images/DELIVERED.png": "6cc2cc726dd68745f9c51b33c812669e",
"assets/assets/images/edit2.png": "0c5d573de08d63d230061b9ba004a1d0",
"assets/assets/images/email.png": "102aad38439e73485bd99c8fa333fd5c",
"assets/assets/images/empty_state.png": "1a1382c0d6f2d6a899f72cb6a03fd5be",
"assets/assets/images/file.png": "a161badec6c57c779e468020a683d11d",
"assets/assets/images/gallery_edit.png": "037fa73a9753e030108dc04779607fb8",
"assets/assets/images/gender.png": "2ed3db86638f1af641de1875f619e0ab",
"assets/assets/images/icon.png": "55f5a2502216b48c3d50374221ac3b41",
"assets/assets/images/key.png": "2584fe5ee4eba411fb68794c7e8bf738",
"assets/assets/images/landing_img.png": "1f0ad4f86bdca3f9cc7ada597cdf1c93",
"assets/assets/images/location.png": "87c9d34d6e2453ab37b0f7c1da9845cd",
"assets/assets/images/location1.png": "eb3039a5d879b0ed3ae98eb4a02e11b2",
"assets/assets/images/login.png": "d1e7c00e0e63b392abbff02a3642372b",
"assets/assets/images/logo.png": "9e0c6010b11dbb7c37f21ca3524f3bd4",
"assets/assets/images/logout.png": "aebff25da578db5b05cc2c38faf171fe",
"assets/assets/images/logout_icon.png": "57f046277e75cc9ba6839448385de0b8",
"assets/assets/images/nav1.png": "953c024461754344b05dd0af3c08cc7d",
"assets/assets/images/nav2.png": "c72bfb83942a34e2da37eb63cccc6ee9",
"assets/assets/images/nav3.png": "4a32d1f524fc37984c2ef993dd3a4922",
"assets/assets/images/nav4.png": "244c59df0d6f2795cd0dc47ffbd76f03",
"assets/assets/images/nav5.png": "d7898b34021ea20e3369bcb8a05028be",
"assets/assets/images/ornament.png": "85083b69a27192846d19ec09b264553f",
"assets/assets/images/PENDING.png": "f843aca8d0e743ea84fafef994c251de",
"assets/assets/images/people.png": "23efce65630d41bfec108d141927b6ac",
"assets/assets/images/personalcard.png": "a36b4d9f0a7b0925f315d9778632d4d5",
"assets/assets/images/preregisterfemal.png": "78b583a5758f7f6e969005a6cc333452",
"assets/assets/images/prerigester_icon.png": "57449feaeafb00d5169d4df574b06a94",
"assets/assets/images/profile.png": "5ccb9e08298fbcdcff489a7b1ea010f0",
"assets/assets/images/profile2.png": "c29ceb21de1a1affbc863556221bdbec",
"assets/assets/images/right.png": "d73086e828963573ebd8cb335833821b",
"assets/assets/images/SEEN.png": "a389e2d831e2739a7276b57d8f30af7a",
"assets/assets/images/SENT.png": "37457a18f5f77c841bdf73d8c438a3ea",
"assets/assets/images/sms.png": "8337f849d88c7eac97d46d27dbf2e040",
"assets/assets/images/trash.png": "001d5f7f3e1f6cc3bf690139a65bd29a",
"assets/assets/images/update.png": "cacbfe61e49fa80549b7f01b5d3d358f",
"assets/assets/images/user_name.png": "88cb6d1c28e4749391acc5995a3649ab",
"assets/assets/images/user_tick.png": "24193bd6f12eb509f919d390c9dec472",
"assets/assets/images/visitor.png": "4d1cf2753bcdc02acbf2837472f9b1a2",
"assets/assets/new/badge.svg": "bec7435807fff6fdc4b1e0ed084b66f1",
"assets/assets/new/blue.png": "1459add58b42971c71ab5dd46b595de5",
"assets/assets/new/calendar.png": "c7355e0f7dc71cdf5c7d25a48fc5ecb4",
"assets/assets/new/calendar_icon.png": "b6bd81f894c8d5195927c9874e7fe6ed",
"assets/assets/new/car_onboard.png": "2eb8f34a710bd16ba35d76cbffd5c2c7",
"assets/assets/new/clock.png": "4c3ccfb9c97591e7dee56ae3faf1aed9",
"assets/assets/new/clock.svg": "280d93e47d03c63dec9a49faa039848d",
"assets/assets/new/collegue.svg": "2f67a157eeafb03eb20cc24b8621d013",
"assets/assets/new/empty_chat.svg": "76ab7818cf4551f8d58493dbd29aca99",
"assets/assets/new/example_data.json": "f63deb6aadbbf527f1ddf1368ab6dfc3",
"assets/assets/new/filter.svg": "42858b91aeec15df39f1e66151d40647",
"assets/assets/new/home.svg": "d6786745d221d73eb91bcf8b166c83bd",
"assets/assets/new/icon.png": "af30493a39a41807788e8a640456a957",
"assets/assets/new/id.png": "ead54a42b9fffadf77294df6484b1d27",
"assets/assets/new/logo.png": "98871a0ab1fa1b0a5a949caa7f009bad",
"assets/assets/new/notif.png": "09bcc59aad2da9181c93235cd8d743b1",
"assets/assets/new/personne.svg": "55e3d8f2048af956e5740eb31b96a990",
"assets/assets/new/profile.svg": "1afda86c117d3289419cbe11b44a7983",
"assets/assets/new/Qr%2520Code.png": "0c9412605ebeb78d32f955401a3de9c2",
"assets/assets/new/schedule.svg": "935d3d839bbbaa7920ff0c5da0903a87",
"assets/assets/new/search.svg": "ed0996a40ef8801053a18b52b52f428c",
"assets/assets/new/user.png": "9973a8839bdf006b1a0335ea098e5686",
"assets/assets/new/user_onboard.png": "3e43827fb39f29476dcaab64f9341b8e",
"assets/assets/new/visitors.svg": "3f15627be95a9cf75f8daca247c58db1",
"assets/assets/new/vvims%2520copy.png": "98871a0ab1fa1b0a5a949caa7f009bad",
"assets/assets/new/vvims.png": "98871a0ab1fa1b0a5a949caa7f009bad",
"assets/assets/new/vvims50.png": "dd55a84cae2c6a2f159e72a4c59ee61e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "41589ea5a1813d507e307affc174caca",
"assets/NOTICES": "d15ed84c33770dad9e263e6ca53f2969",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/rflutter_alert/assets/images/2.0x/close.png": "abaa692ee4fa94f76ad099a7a437bd4f",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_error.png": "2da9704815c606109493d8af19999a65",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_info.png": "612ea65413e042e3df408a8548cefe71",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_success.png": "7d6abdd1b85e78df76b2837996749a43",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_warning.png": "e4606e6910d7c48132912eb818e3a55f",
"assets/packages/rflutter_alert/assets/images/3.0x/close.png": "98d2de9ca72dc92b1c9a2835a7464a8c",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_error.png": "15ca57e31f94cadd75d8e2b2098239bd",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_info.png": "e68e8527c1eb78949351a6582469fe55",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_success.png": "1c04416085cc343b99d1544a723c7e62",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_warning.png": "e5f369189faa13e7586459afbe4ffab9",
"assets/packages/rflutter_alert/assets/images/close.png": "13c168d8841fcaba94ee91e8adc3617f",
"assets/packages/rflutter_alert/assets/images/icon_error.png": "f2b71a724964b51ac26239413e73f787",
"assets/packages/rflutter_alert/assets/images/icon_info.png": "3f71f68cae4d420cecbf996f37b0763c",
"assets/packages/rflutter_alert/assets/images/icon_success.png": "8bb472ce3c765f567aa3f28915c1a8f4",
"assets/packages/rflutter_alert/assets/images/icon_warning.png": "ccfc1396d29de3ac730da38a8ab20098",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5d66157ccc8dc78ffd13c26335b490f1",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "bb22d925bbb632e961b406bf0974d584",
"icons/Icon-192.png": "525b6ad13c8df7e610e166bfb9b49213",
"icons/Icon-512.png": "7ee15eefc55c545ddcf2779d37e15f8e",
"icons/Icon-maskable-192.png": "525b6ad13c8df7e610e166bfb9b49213",
"icons/Icon-maskable-512.png": "7ee15eefc55c545ddcf2779d37e15f8e",
"index.html": "c3842eac55a065f92a6e82178c1128dc",
"/": "c3842eac55a065f92a6e82178c1128dc",
"main.dart.js": "01f0fcc15341190ce643a959bf4cd4eb",
"manifest.json": "73e86f0a2701d579229e60221e41da39",
"version.json": "4b675790a84b93934af7d148fc8593ec"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
