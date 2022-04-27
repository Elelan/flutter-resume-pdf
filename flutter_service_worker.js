'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "f30428f02930d7943ccc10466297f56c",
"index.html": "e794bf961c7e5805cf385f4f5bfde7a9",
"/": "e794bf961c7e5805cf385f4f5bfde7a9",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/fonts/Raleway/Raleway-Regular.ttf": "75b4247fdd3b97d0e3b8e07b115673c2",
"assets/fonts/Raleway/Raleway-Bold.ttf": "7802d8b27fcb19893ce6b38c0789268e",
"assets/fonts/Raleway/Raleway-Medium.ttf": "2ec8557460d3a2cd7340b16ac84fce32",
"assets/fonts/Raleway/Raleway-SemiBold.ttf": "8a192102b50118c45033e53ce897f103",
"assets/fonts/MaterialIcons-Regular.svg": "a1adea65594c502f9d9428f13ae210e1",
"assets/fonts/MaterialIcons-Regular.ijmap": "ed6a98d002bc0b535dd8618f3ae05fe7",
"assets/fonts/MaterialIcons-Regular.ttf": "a37b0c01c0baf1888ca812cc0508f6e2",
"assets/fonts/codepoints": "861b6ac15aeed39b13aa390a84045082",
"assets/fonts/MaterialIcons-Regular.woff2": "570eb83859dc23dd0eec423a49e147fe",
"assets/fonts/MaterialIcons-Regular.woff": "012cf6a10129e2275d79d6adac7f3b02",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/fonts/MaterialIcons-Regular.eot": "e79bfd88537def476913f3ed52f4f4b3",
"assets/fonts/material-icons.css": "c5941eed2e20a509114128aab1e96edf",
"assets/OpenSans-ExtraBoldItalic.ttf": "37f52104364c2eb5482fd85777bda0ac",
"assets/AssetManifest.json": "7a1cd29adf08bae1ee4ec6484e935706",
"assets/packages/flutter_vector_icons/fonts/Ionicons.ttf": "b3263095df30cb7db78c613e73f9499a",
"assets/packages/flutter_vector_icons/fonts/Foundation.ttf": "e20945d7c929279ef7a6f1db184a4470",
"assets/packages/flutter_vector_icons/fonts/Entypo.ttf": "744ce60078c17d86006dd0edabcd59a7",
"assets/packages/flutter_vector_icons/fonts/EvilIcons.ttf": "140c53a7643ea949007aa9a282153849",
"assets/packages/flutter_vector_icons/fonts/MaterialCommunityIcons.ttf": "6a2ddad1092a0a1c326b6d0e738e682b",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Brands.ttf": "13685372945d816a2b474fc082fd9aaa",
"assets/packages/flutter_vector_icons/fonts/AntDesign.ttf": "3a2ba31570920eeb9b1d217cabe58315",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Regular.ttf": "db78b9359171f24936b16d84f63af378",
"assets/packages/flutter_vector_icons/fonts/SimpleLineIcons.ttf": "d2285965fe34b05465047401b8595dd0",
"assets/packages/flutter_vector_icons/fonts/FontAwesome.ttf": "b06871f281fee6b241d60582ae9369b9",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Solid.ttf": "1ab236ed440ee51810c56bd16628aef0",
"assets/packages/flutter_vector_icons/fonts/MaterialIcons.ttf": "8ef52a15e44481b41e7db3c7eaf9bb83",
"assets/packages/flutter_vector_icons/fonts/Fontisto.ttf": "b49ae8ab2dbccb02c4d11caaacf09eab",
"assets/packages/flutter_vector_icons/fonts/Feather.ttf": "e766963327e0a89f9ec2ba88646b6177",
"assets/packages/flutter_vector_icons/fonts/Zocial.ttf": "5cdf883b18a5651a29a4d1ef276d2457",
"assets/packages/flutter_vector_icons/fonts/Octicons.ttf": "8e7f807ef943bff1f6d3c2c6e0f3769e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "b62641afc9ab487008e996a5c5865e56",
"assets/logo.svg": "24739b35e6af4ad17953c3eda458361a",
"assets/mobile.png": "717893dcae8a2d775ac2368f1271ca88",
"assets/OpenSans-ExtraBold.ttf": "fb7e3a294cb07a54605a8bb27f0cd528",
"assets/OpenSans-SemiBoldItalic.ttf": "4f04fe541ca8be9b60b500e911b75fb5",
"assets/OpenSans-Light.ttf": "2d0bdc8df10dee036ca3bedf6f3647c6",
"assets/house.png": "8b3bf18a5c3dc0c3c0c23bb06d3b6a34",
"assets/coding.png": "6de08ebf5ed405c29fe3ea15f988d04f",
"assets/FontManifest.json": "822b70e935dbb5a0502a8ab82dcd3ac3",
"assets/OpenSans-Italic.ttf": "f6238deb7f40a7a03134c11fb63ad387",
"assets/resume_bg_2.svg": "d0eec035b6cbfd9f2d39659d5263f6fc",
"assets/like.png": "dfaa8d661cddfcb66ea6ecc53b601afb",
"assets/OpenSans-LightItalic.ttf": "c147d1302b974387afd38590072e7294",
"assets/images/2.png": "1fdb7c800008fbb0a8f92e2a00574672",
"assets/images/envelope.svg": "2ceea2c8d584a1707adedccecab16fd1",
"assets/images/dev_master.svg": "51a69d3237c5aa018a57a0b8c91f1c21",
"assets/images/personal_ingo.svg": "584be46d208c3b3c97db5abc246b519d",
"assets/images/projects/nataloe.png": "f2e32e0341fcde78352c4fb7fd364d7b",
"assets/images/projects/toptaxi.png": "25fc761abc220c62a31a61a41542872f",
"assets/images/projects/omran.png": "ca5fe45e4998ba2cd53c795537419014",
"assets/images/projects/topfood.png": "2e85bf80bf3965f6b85fb19fe1c6d3af",
"assets/images/projects/juda.png": "47dd713dafca0915de28fee247372661",
"assets/images/freelancer.svg": "39a1ddd276fc74c8777d0735035c7746",
"assets/images/contact_us_optimized.svg": "1724ba3ba3960e685ab5e8a51e29f6e7",
"assets/images/twitter_icon.png": "38eb3168749fa8f249265f765f96a9f5",
"assets/images/male_avatar.svg": "374551dc8196fd94371d4a5c6236d7a6",
"assets/images/logo/logo4.png": "3440daff62bc1b5b34f5c93fbf601024",
"assets/images/logo/logo2.png": "f92b3653538364f4aadf316850647afe",
"assets/images/logo/logo3.png": "7358972c29f80af9fe4a76bf4f8e42db",
"assets/images/logo/logo.png": "09b369b52b0bad2097c3d55e636d7d48",
"assets/images/cover.jpg": "1d39c3dd934e44b95eb2ad8533aa8068",
"assets/images/gitlab_icon.png": "bb9fd4eeb3902fd6a967a41639bc9c23",
"assets/images/profile.jpg": "723b2e63ab91ea805723bf4c92f18286",
"assets/images/my_location.svg": "73ca8b1c9e27bf7064e1bcf199046739",
"assets/images/working_master.svg": "64c390342f5783cc29e6f62f22210ac8",
"assets/images/linkedin_icon.png": "1c6823d89f840e7edcae052b57b1794f",
"assets/images/contact_us.svg": "1724ba3ba3960e685ab5e8a51e29f6e7",
"assets/images/bg.jpeg": "03b7b4b800376f9390a5d053dfc4c261",
"assets/images/bellvantage.png": "67143ae57cabbd478bce800c466d0582",
"assets/images/background.jpg": "346c1daab54715d3701cddb8b2ee0999",
"assets/images/develop_app.svg": "930cebe70f5db97458fe6029306073ac",
"assets/Roboto-Black.ttf": "5ebb24ee1112dd9562629375c387879a",
"assets/OpenSans-SemiBold.ttf": "ba5cde21eeea0d57ab7efefc99596cce",
"assets/house.svg": "f2bb8be17f10dc1e19164d642f7f991e",
"assets/at.png": "c777951241bf59ff161085604d4ce78e",
"assets/assets/fonts/Raleway/Raleway-Regular.ttf": "75b4247fdd3b97d0e3b8e07b115673c2",
"assets/assets/fonts/Raleway/Raleway-Bold.ttf": "7802d8b27fcb19893ce6b38c0789268e",
"assets/assets/fonts/Raleway/Raleway-Medium.ttf": "2ec8557460d3a2cd7340b16ac84fce32",
"assets/assets/fonts/Raleway/Raleway-SemiBold.ttf": "8a192102b50118c45033e53ce897f103",
"assets/assets/fonts/MaterialIcons-Regular.svg": "a1adea65594c502f9d9428f13ae210e1",
"assets/assets/fonts/MaterialIcons-Regular.ijmap": "ed6a98d002bc0b535dd8618f3ae05fe7",
"assets/assets/fonts/MaterialIcons-Regular.ttf": "a37b0c01c0baf1888ca812cc0508f6e2",
"assets/assets/fonts/codepoints": "861b6ac15aeed39b13aa390a84045082",
"assets/assets/fonts/MaterialIcons-Regular.woff2": "570eb83859dc23dd0eec423a49e147fe",
"assets/assets/fonts/MaterialIcons-Regular.woff": "012cf6a10129e2275d79d6adac7f3b02",
"assets/assets/fonts/MaterialIcons-Regular.eot": "e79bfd88537def476913f3ed52f4f4b3",
"assets/assets/fonts/material-icons.css": "c5941eed2e20a509114128aab1e96edf",
"assets/assets/OpenSans-ExtraBoldItalic.ttf": "37f52104364c2eb5482fd85777bda0ac",
"assets/assets/MaterialIcons-Regular.ttf": "8ef52a15e44481b41e7db3c7eaf9bb83",
"assets/assets/logo.svg": "24739b35e6af4ad17953c3eda458361a",
"assets/assets/mobile.png": "717893dcae8a2d775ac2368f1271ca88",
"assets/assets/OpenSans-ExtraBold.ttf": "fb7e3a294cb07a54605a8bb27f0cd528",
"assets/assets/OpenSans-SemiBoldItalic.ttf": "4f04fe541ca8be9b60b500e911b75fb5",
"assets/assets/OpenSans-Light.ttf": "2d0bdc8df10dee036ca3bedf6f3647c6",
"assets/assets/house.png": "8b3bf18a5c3dc0c3c0c23bb06d3b6a34",
"assets/assets/coding.png": "6de08ebf5ed405c29fe3ea15f988d04f",
"assets/assets/OpenSans-Italic.ttf": "f6238deb7f40a7a03134c11fb63ad387",
"assets/assets/resume_bg_2.svg": "d0eec035b6cbfd9f2d39659d5263f6fc",
"assets/assets/like.png": "dfaa8d661cddfcb66ea6ecc53b601afb",
"assets/assets/OpenSans-LightItalic.ttf": "c147d1302b974387afd38590072e7294",
"assets/assets/images/2.png": "1fdb7c800008fbb0a8f92e2a00574672",
"assets/assets/images/envelope.svg": "2ceea2c8d584a1707adedccecab16fd1",
"assets/assets/images/dev_master.svg": "51a69d3237c5aa018a57a0b8c91f1c21",
"assets/assets/images/personal_ingo.svg": "584be46d208c3b3c97db5abc246b519d",
"assets/assets/images/freelancer.svg": "39a1ddd276fc74c8777d0735035c7746",
"assets/assets/images/contact_us_optimized.svg": "1724ba3ba3960e685ab5e8a51e29f6e7",
"assets/assets/images/twitter_icon.png": "38eb3168749fa8f249265f765f96a9f5",
"assets/assets/images/male_avatar.svg": "374551dc8196fd94371d4a5c6236d7a6",
"assets/assets/images/logo/logo4.png": "3440daff62bc1b5b34f5c93fbf601024",
"assets/assets/images/logo/logo2.png": "f92b3653538364f4aadf316850647afe",
"assets/assets/images/logo/logo3.png": "7358972c29f80af9fe4a76bf4f8e42db",
"assets/assets/images/logo/logo.png": "09b369b52b0bad2097c3d55e636d7d48",
"assets/assets/images/cover.jpg": "1d39c3dd934e44b95eb2ad8533aa8068",
"assets/assets/images/gitlab_icon.png": "bb9fd4eeb3902fd6a967a41639bc9c23",
"assets/assets/images/my_location.svg": "73ca8b1c9e27bf7064e1bcf199046739",
"assets/assets/images/working_master.svg": "64c390342f5783cc29e6f62f22210ac8",
"assets/assets/images/linkedin_icon.png": "1c6823d89f840e7edcae052b57b1794f",
"assets/assets/images/contact_us.svg": "1724ba3ba3960e685ab5e8a51e29f6e7",
"assets/assets/images/bg.jpeg": "03b7b4b800376f9390a5d053dfc4c261",
"assets/assets/images/bellvantage.png": "67143ae57cabbd478bce800c466d0582",
"assets/assets/images/background.jpg": "346c1daab54715d3701cddb8b2ee0999",
"assets/assets/images/develop_app.svg": "930cebe70f5db97458fe6029306073ac",
"assets/assets/cv_bg.png": "2e49bbe4f18cc810217a21d8efc3ef5f",
"assets/assets/Roboto-Black.ttf": "5ebb24ee1112dd9562629375c387879a",
"assets/assets/OpenSans-SemiBold.ttf": "ba5cde21eeea0d57ab7efefc99596cce",
"assets/assets/house.svg": "f2bb8be17f10dc1e19164d642f7f991e",
"assets/assets/at.png": "c777951241bf59ff161085604d4ce78e",
"assets/assets/Roboto-Light.ttf": "88823c2015ffd5fa89d567e17297a137",
"assets/assets/icons/list.png": "4e63ee6122b58866f4a2d2408c02f9ef",
"assets/assets/icons/email.png": "ecf609bb48c645251a898c5527f7c781",
"assets/assets/icons/coffee.png": "19e4f65ea926133b771bf82daa35f5d4",
"assets/assets/icons/logo.svg": "c9931bc4e93cda3b203dae019b85688e",
"assets/assets/icons/double-up-arrow.png": "d758827b82d3262d54d19f7482c36b63",
"assets/assets/icons/pencil.png": "4566fb93d2196b9b2b74be9cfe23d0c8",
"assets/assets/icons/coding.png": "c8150fc2000e8674220bcd485b30e68f",
"assets/assets/icons/feather_dribbble.svg": "89b806ce6cc9dea635b81d7dc2406352",
"assets/assets/icons/feather_thumbs-up.svg": "a066c16fa33209a18b5282c40da1cf78",
"assets/assets/icons/feather_message-square.svg": "5194a360f12626cb541cc80f58c4f217",
"assets/assets/icons/behance-alt.svg": "5c5cb1c76f9e70c3906f061365fdac19",
"assets/assets/icons/call.png": "9e299bb392428812cffbdadaf9272b15",
"assets/assets/icons/github.png": "0918d78648457def080137b179fc5608",
"assets/assets/icons/happy.png": "3837c30afeb5b40886a787810f553fc3",
"assets/assets/icons/design.png": "c59f68c8be347d0a5231b2b714421b24",
"assets/assets/icons/pin.png": "c40700870fa15459e94f3ffd6eccfcfd",
"assets/assets/icons/feather_search.svg": "9d58d567fd606a3fdf19583f8685523d",
"assets/assets/icons/facebook.png": "d03d1cb8afb8da75756264994a9ce4d4",
"assets/assets/icons/menu.png": "3ca1d45f78b3acb1d2a89a53271a21db",
"assets/assets/icons/linkedin.png": "3c963b14a58df80613b15c7e9e4e9c57",
"assets/assets/icons/mobile_dev.svg": "075da35bcbbf7daad4afb13d3a29b474",
"assets/assets/icons/feather_twitter.svg": "3a254ce88e725b0169c202752364535e",
"assets/assets/icons/feather_share-2.svg": "2eadf3eff1fb945866235c94ec30915d",
"assets/assets/icons/briefcase.png": "12e9358e8dbae5cb406a7abeec84d4f5",
"assets/assets/icons/twitter.png": "cadd7c4e3a3a29ddfa395393e652012a",
"assets/assets/calendar.svg": "44dc5e7c4290b9312b91f0cb3377bd2d",
"assets/assets/resume.svg": "46677fc92c26b05ef05f6f57ee6cbf2f",
"assets/assets/open-sans-bold.ttf": "1025a6e0fb0fa86f17f57cc82a6b9756",
"assets/assets/profile.jpg": "723b2e63ab91ea805723bf4c92f18286",
"assets/assets/Roboto-Regular.ttf": "11eabca2251325cfc5589c9c6fb57b46",
"assets/assets/OpenSans-Regular.ttf": "3ed9575dcc488c3e3a5bd66620bdf5a4",
"assets/assets/at.svg": "f4cc1dd97bf2f21d79940105cf879986",
"assets/assets/invoice.svg": "ed6bd474d30a8d750aa924a78918b1ac",
"assets/assets/resume_bg.svg": "aa7e45f453ad44145c37f233ac3c0366",
"assets/assets/material.ttf": "434a46fd7991092895a408cce2f98e22",
"assets/assets/OpenSans-BoldItalic.ttf": "3a8113737b373d5bccd6f71d91408d16",
"assets/assets/open-sans.ttf": "3ed9575dcc488c3e3a5bd66620bdf5a4",
"assets/Roboto-Light.ttf": "88823c2015ffd5fa89d567e17297a137",
"assets/icons/list.png": "4e63ee6122b58866f4a2d2408c02f9ef",
"assets/icons/email.png": "ecf609bb48c645251a898c5527f7c781",
"assets/icons/coffee.png": "19e4f65ea926133b771bf82daa35f5d4",
"assets/icons/logo.svg": "c9931bc4e93cda3b203dae019b85688e",
"assets/icons/double-up-arrow.png": "d758827b82d3262d54d19f7482c36b63",
"assets/icons/pencil.png": "4566fb93d2196b9b2b74be9cfe23d0c8",
"assets/icons/coding.png": "c8150fc2000e8674220bcd485b30e68f",
"assets/icons/feather_dribbble.svg": "89b806ce6cc9dea635b81d7dc2406352",
"assets/icons/feather_thumbs-up.svg": "a066c16fa33209a18b5282c40da1cf78",
"assets/icons/feather_message-square.svg": "5194a360f12626cb541cc80f58c4f217",
"assets/icons/behance-alt.svg": "5c5cb1c76f9e70c3906f061365fdac19",
"assets/icons/call.png": "9e299bb392428812cffbdadaf9272b15",
"assets/icons/github.png": "0918d78648457def080137b179fc5608",
"assets/icons/happy.png": "3837c30afeb5b40886a787810f553fc3",
"assets/icons/design.png": "c59f68c8be347d0a5231b2b714421b24",
"assets/icons/pin.png": "c40700870fa15459e94f3ffd6eccfcfd",
"assets/icons/feather_search.svg": "9d58d567fd606a3fdf19583f8685523d",
"assets/icons/facebook.png": "d03d1cb8afb8da75756264994a9ce4d4",
"assets/icons/menu.png": "3ca1d45f78b3acb1d2a89a53271a21db",
"assets/icons/linkedin.png": "3c963b14a58df80613b15c7e9e4e9c57",
"assets/icons/mobile_dev.svg": "075da35bcbbf7daad4afb13d3a29b474",
"assets/icons/feather_twitter.svg": "3a254ce88e725b0169c202752364535e",
"assets/icons/feather_share-2.svg": "2eadf3eff1fb945866235c94ec30915d",
"assets/icons/briefcase.png": "12e9358e8dbae5cb406a7abeec84d4f5",
"assets/icons/twitter.png": "cadd7c4e3a3a29ddfa395393e652012a",
"assets/calendar.svg": "44dc5e7c4290b9312b91f0cb3377bd2d",
"assets/resume.svg": "46677fc92c26b05ef05f6f57ee6cbf2f",
"assets/open-sans-bold.ttf": "1025a6e0fb0fa86f17f57cc82a6b9756",
"assets/profile.jpg": "723b2e63ab91ea805723bf4c92f18286",
"assets/Roboto-Regular.ttf": "11eabca2251325cfc5589c9c6fb57b46",
"assets/materialicons-regular.ttf": "8ef52a15e44481b41e7db3c7eaf9bb83",
"assets/OpenSans-Regular.ttf": "3ed9575dcc488c3e3a5bd66620bdf5a4",
"assets/at.svg": "f4cc1dd97bf2f21d79940105cf879986",
"assets/invoice.svg": "ed6bd474d30a8d750aa924a78918b1ac",
"assets/NOTICES": "bdff28843118bb7026993294c458f69f",
"assets/resume_bg.svg": "aa7e45f453ad44145c37f233ac3c0366",
"assets/material.ttf": "434a46fd7991092895a408cce2f98e22",
"assets/OpenSans-BoldItalic.ttf": "3a8113737b373d5bccd6f71d91408d16",
"assets/open-sans.ttf": "3ed9575dcc488c3e3a5bd66620bdf5a4",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"styles.css": "19e29d6c0b3415602a60671563541475",
"manifest.json": "f02ac37f2db2c6420e51f0a2da77f2d4",
"version.json": "e42cdaa79fff73703d459d8fa23c174e",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
