//
//  NSString+FontAwesome.m
//
//  Copyright (c) 2012 Alex Usbergo. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//

#import "NSString+FontAwesome.h"

@implementation NSString (FontAwesome)

#pragma mark - Public API
+ (FAIcon)fontAwesomeEnumForIconIdentifier:(NSString*)string {
    NSDictionary *enums = [self enumDictionary];
    return [enums[string] integerValue];
}

+ (NSString*)fontAwesomeIconStringForEnum:(FAIcon)value {
    return [NSString fontAwesomeUnicodeStrings][value];
}

+ (NSString*)fontAwesomeIconStringForIconIdentifier:(NSString*)identifier {
    return [self fontAwesomeIconStringForEnum:[self fontAwesomeEnumForIconIdentifier:identifier]];
}

#pragma mark - Data Initialization
+ (NSArray *)fontAwesomeUnicodeStrings {
    
    static NSArray *fontAwesomeUnicodeStrings;
    
    static dispatch_once_t unicodeStringsOnceToken;
    dispatch_once(&unicodeStringsOnceToken, ^{
        
        fontAwesomeUnicodeStrings = @[@"\uf000", @"\uf001", @"\uf002", @"\uf003", @"\uf004", @"\uf005", @"\uf006", @"\uf007", @"\uf008", @"\uf009",
                                      @"\uf00a", @"\uf00b", @"\uf00c", @"\uf00d", @"\uf00e", @"\uf010", @"\uf011", @"\uf011", @"\uf012", @"\uf013",
                                      @"\uf013", @"\uf014", @"\uf015", @"\uf016", @"\uf017", @"\uf018", @"\uf019", @"\uf01a", @"\uf01b", @"\uf01c",
                                      @"\uf01d", @"\uf01e", @"\uf01e", @"\uf021", @"\uf022", @"\uf023", @"\uf024", @"\uf025", @"\uf026", @"\uf027",
                                      @"\uf028", @"\uf029", @"\uf02a", @"\uf02b", @"\uf02c", @"\uf02d", @"\uf02e", @"\uf02f", @"\uf030", @"\uf031",
                                      @"\uf032", @"\uf033", @"\uf034", @"\uf035", @"\uf036", @"\uf037", @"\uf038", @"\uf039", @"\uf03a", @"\uf03b",
                                      @"\uf03c", @"\uf03d", @"\uf03e", @"\uf040", @"\uf041", @"\uf042", @"\uf043", @"\uf044", @"\uf045", @"\uf046",
                                      @"\uf047", @"\uf048", @"\uf049", @"\uf04a", @"\uf04b", @"\uf04c", @"\uf04d", @"\uf04e", @"\uf050", @"\uf051",
                                      @"\uf052", @"\uf053", @"\uf054", @"\uf055", @"\uf056", @"\uf057", @"\uf058", @"\uf059", @"\uf05a", @"\uf05b",
                                      @"\uf05c", @"\uf05d", @"\uf05e", @"\uf060", @"\uf061", @"\uf062", @"\uf063", @"\uf064", @"\uf064", @"\uf065",
                                      @"\uf066", @"\uf067", @"\uf068", @"\uf069", @"\uf06a", @"\uf06b", @"\uf06c", @"\uf06d", @"\uf06e", @"\uf070",
                                      @"\uf071", @"\uf072", @"\uf073", @"\uf074", @"\uf075", @"\uf076", @"\uf077", @"\uf078", @"\uf079", @"\uf07a",
                                      @"\uf07b", @"\uf07c", @"\uf07d", @"\uf07e", @"\uf080", @"\uf081", @"\uf082", @"\uf083", @"\uf084", @"\uf085",
                                      @"\uf085", @"\uf086", @"\uf087", @"\uf088", @"\uf089", @"\uf08a", @"\uf08b", @"\uf08c", @"\uf08d", @"\uf08e",
                                      @"\uf090", @"\uf091", @"\uf092", @"\uf093", @"\uf094", @"\uf095", @"\uf096", @"\uf096", @"\uf097", @"\uf098",
                                      @"\uf099", @"\uf09a", @"\uf09b", @"\uf09c", @"\uf09d", @"\uf09e", @"\uf0a0", @"\uf0a1", @"\uf0a2", @"\uf0a3",
                                      @"\uf0a4", @"\uf0a5", @"\uf0a6", @"\uf0a7", @"\uf0a8", @"\uf0a9", @"\uf0aa", @"\uf0ab", @"\uf0ac", @"\uf0ad",
                                      @"\uf0ae", @"\uf0b0", @"\uf0b1", @"\uf0b2", @"\uf0c0", @"\uf0c1", @"\uf0c2", @"\uf0c3", @"\uf0c4", @"\uf0c5",
                                      @"\uf0c6", @"\uf0c7", @"\uf0c8", @"\uf0c9", @"\uf0ca", @"\uf0cb", @"\uf0cc", @"\uf0cd", @"\uf0ce", @"\uf0d0",
                                      @"\uf0d1", @"\uf0d2", @"\uf0d3", @"\uf0d4", @"\uf0d5", @"\uf0d6", @"\uf0d7", @"\uf0d8", @"\uf0d9", @"\uf0da",
                                      @"\uf0db", @"\uf0dc", @"\uf0dd", @"\uf0de", @"\uf0e0", @"\uf0e1", @"\uf0e2", @"\uf0e2", @"\uf0e3", @"\uf0e4",
                                      @"\uf0e5", @"\uf0e6", @"\uf0e7", @"\uf0e8", @"\uf0e9", @"\uf0ea", @"\uf0eb", @"\uf0ec", @"\uf0ed", @"\uf0ee",
                                      @"\uf0f0", @"\uf0f1", @"\uf0f2", @"\uf0f3", @"\uf0f4", @"\uf0f5", @"\uf0f6", @"\uf0f7", @"\uf0f8", @"\uf0f9",
                                      @"\uf0fa", @"\uf0fb", @"\uf0fc", @"\uf0fd", @"\uf0fe", @"\uf100", @"\uf101", @"\uf102", @"\uf103", @"\uf104",
                                      @"\uf105", @"\uf106", @"\uf107", @"\uf108", @"\uf109", @"\uf10a", @"\uf10b", @"\uf10c", @"\uf10d", @"\uf10e",
                                      @"\uf110", @"\uf111", @"\uf112", @"\uf112", @"\uf113", @"\uf114", @"\uf115", @"\uf116", @"\uf117", @"\uf118",
                                      @"\uf119", @"\uf11a", @"\uf11b", @"\uf11c", @"\uf11d", @"\uf11e", @"\uf120", @"\uf121", @"\uf122", @"\uf122",
                                      @"\uf123", @"\uf123", @"\uf124", @"\uf125", @"\uf126", @"\uf127", @"\uf128", @"\uf129", @"\uf12a", @"\uf12b",
                                      @"\uf12c", @"\uf12d", @"\uf12e", @"\uf130", @"\uf131", @"\uf132", @"\uf133", @"\uf134", @"\uf135", @"\uf136",
                                      @"\uf137", @"\uf138", @"\uf139", @"\uf13a", @"\uf13b", @"\uf13c", @"\uf13d", @"\uf13e", @"\uf140", @"\uf141",
                                      @"\uf142", @"\uf143", @"\uf144", @"\uf145", @"\uf146", @"\uf147", @"\uf148", @"\uf149", @"\uf14a", @"\uf14b",
                                      @"\uf14c", @"\uf14d", @"\uf14e", @"\uf150", @"\uf151", @"\uf152", @"\uf153", @"\uf153", @"\uf154", @"\uf155",
                                      @"\uf155", @"\uf156", @"\uf156", @"\uf157", @"\uf157", @"\uf158", @"\uf158", @"\uf159", @"\uf159", @"\uf15a",
                                      @"\uf15a", @"\uf15a", @"\uf15b", @"\uf15c", @"\uf15d", @"\uf15e", @"\uf160", @"\uf161", @"\uf162", @"\uf163",
                                      @"\uf164", @"\uf165", @"\uf166", @"\uf167", @"\uf168", @"\uf169", @"\uf16a", @"\uf16b", @"\uf16c", @"\uf16d",
                                      @"\uf16e", @"\uf170", @"\uf171", @"\uf172", @"\uf173", @"\uf174", @"\uf175", @"\uf176", @"\uf177", @"\uf178",
                                      @"\uf179", @"\uf17a", @"\uf17b", @"\uf17c", @"\uf17d", @"\uf17e", @"\uf180", @"\uf181", @"\uf182", @"\uf183",
                                      @"\uf184", @"\uf185", @"\uf186", @"\uf187", @"\uf188", @"\uf189", @"\uf18a", @"\uf18b", @"\uf209", @"\uf207",
                                      @"\uf1f2", @"\uf1ee", @"\uf203", @"\uf1fc", @"\uf20b", @"\uf204", @"\uf1e8", @"\uf1fe", @"\uf206", @"\uf1ec",
                                      @"\uf1f1", @"\uf1f9", @"\uf201", @"\uf1ed", @"\uf205", @"\uf1eb", @"\uf1fa", @"\uf1e5", @"\uf20a", @"\uf1f4",
                                      @"\uf1fb", @"\uf208", @"\uf20c", @"\uf200", @"\uf1e7", @"\uf1f8", @"\uf1e9", @"\uf1f6", @"\uf1fd", @"\uf1f3",
                                      @"\uf1f5", @"\uf1e3", @"\uf202", @"\uf1ea", @"\uf1e6", @"\uf1e4"];

    });
    
    return fontAwesomeUnicodeStrings;
}

+ (NSDictionary *)enumDictionary {
    
	static NSDictionary *enumDictionary;
    
    static dispatch_once_t enumDictionaryOnceToken;
    dispatch_once(&enumDictionaryOnceToken, ^{
        
		NSMutableDictionary *tmp = [[NSMutableDictionary alloc] init];        
        tmp[@"fa-glass"]          = @(FAIconGlass);
        tmp[@"fa-music"]          = @(FAIconMusic);
        tmp[@"fa-search"]         = @(FAIconSearch);
        tmp[@"fa-envelope-alt"]   = @(FAIconEnvelopeAlt);
        tmp[@"fa-heart"]          = @(FAIconHeart);
        tmp[@"fa-star"]           = @(FAIconStar);
        tmp[@"fa-star-empty"]     = @(FAIconStarEmpty);
        tmp[@"fa-user"]           = @(FAIconUser);
        tmp[@"fa-film"]           = @(FAIconFilm);
        tmp[@"fa-th-large"]       = @(FAIconThLarge);
        tmp[@"fa-th"]             = @(FAIconTh);
        tmp[@"fa-th-list"]        = @(FAIconThList);
        tmp[@"fa-ok"]             = @(FAIconOk);
        tmp[@"fa-remove"]         = @(FAIconRemove);
        tmp[@"fa-zoom-in"]        = @(FAIconZoomIn);
        tmp[@"fa-zoom-out"]       = @(FAIconZoomOut);
        tmp[@"fa-off"]            = @(FAIconOff);
        tmp[@"fa-power-off"]      = @(FAIconPowerOff);
        tmp[@"fa-signal"]         = @(FAIconSignal);
        tmp[@"fa-cog"]            = @(FAIconCog);
        tmp[@"fa-Gear"]           = @(FAIconGear);
        tmp[@"fa-trash"]          = @(FAIconTrash);
        tmp[@"fa-home"]           = @(FAIconHome);
        tmp[@"fa-file-alt"]       = @(FAIconFileAlt);
        tmp[@"fa-time"]           = @(FAIconTime);
        tmp[@"fa-road"]           = @(FAIconRoad);
        tmp[@"fa-download-alt"]   = @(FAIconDownloadAlt);
        tmp[@"fa-download"]       = @(FAIconDownload);
        tmp[@"fa-upload"]         = @(FAIconUpload);
        tmp[@"fa-inbox"]          = @(FAIconInbox);
        tmp[@"fa-play-circle"]    = @(FAIconPlayCircle);
        tmp[@"fa-repeat"]         = @(FAIconRepeat);
        tmp[@"fa-rotate-right"]   = @(FAIconRotateRight);
        tmp[@"fa-refresh"]        = @(FAIconRefresh);
        tmp[@"fa-list-alt"]       = @(FAIconListAlt);
        tmp[@"fa-lock"]           = @(FAIconLock);
        tmp[@"fa-flag"]           = @(FAIconFlag);
        tmp[@"fa-headphones"]     = @(FAIconHeadphones);
        tmp[@"fa-volume-off"]     = @(FAIconVolumeOff);
        tmp[@"fa-volume-down"]    = @(FAIconVolumeDown);
        tmp[@"fa-volume-up"]      = @(FAIconVolumeUp);
        tmp[@"fa-qrcode"]         = @(FAIconQrcode);
        tmp[@"fa-barcode"]        = @(FAIconBarcode);
        tmp[@"fa-tag"]            = @(FAIconTag);
        tmp[@"fa-tags"]           = @(FAIconTags);
        tmp[@"fa-book"]           = @(FAIconBook);
        tmp[@"fa-bookmark"]       = @(FAIconBookmark);
        tmp[@"fa-print"]          = @(FAIconPrint);
        tmp[@"fa-camera"]         = @(FAIconCamera);
        tmp[@"fa-font"]           = @(FAIconFont);
        tmp[@"fa-bold"]           = @(FAIconBold);
        tmp[@"fa-italic"]         = @(FAIconItalic);
        tmp[@"fa-text-height"]    = @(FAIconTextHeight);
        tmp[@"fa-text-width"]     = @(FAIconTextWidth);
        tmp[@"fa-align-left"]     = @(FAIconAlignLeft);
        tmp[@"fa-align-center"]   = @(FAIconAlignCenter);
        tmp[@"fa-align-right"]    = @(FAIconAlignRight);
        tmp[@"fa-align-justify"]  = @(FAIconAlignJustify);
        tmp[@"fa-list"]           = @(FAIconList);
        tmp[@"fa-indent-left"]    = @(FAIconIndentLeft);
        tmp[@"fa-indent-right"]   = @(FAIconIndentRight);
        tmp[@"fa-facetime-video"] = @(FAIconFacetimeVideo);
        tmp[@"fa-picture"]        = @(FAIconPicture);
        tmp[@"fa-pencil"]         = @(FAIconPencil);
        tmp[@"fa-map-marker"]     = @(FAIconMapMarker);
        tmp[@"fa-adjust"]         = @(FAIconAdjust);
        tmp[@"fa-tint"]           = @(FAIconTint);
        tmp[@"fa-edit"]           = @(FAIconEdit);
        tmp[@"fa-share"]          = @(FAIconShare);
        tmp[@"fa-check"]          = @(FAIconCheck);
        tmp[@"fa-move"]           = @(FAIconMove);
        tmp[@"fa-step-backward"]  = @(FAIconStepBackward);
        tmp[@"fa-fast-backward"]  = @(FAIconFastBackward);
        tmp[@"fa-backward"]       = @(FAIconBackward);
        tmp[@"fa-play"]           = @(FAIconPlay);
        tmp[@"fa-pause"]          = @(FAIconPause);
        tmp[@"fa-stop"]           = @(FAIconStop);
        tmp[@"fa-forward"]        = @(FAIconForward);
        tmp[@"fa-fast-forward"]   = @(FAIconFastForward);
        tmp[@"fa-step-forward"]   = @(FAIconStepForward);
        tmp[@"fa-eject"]          = @(FAIconEject);
        tmp[@"fa-chevron-left"]   = @(FAIconChevronLeft);
        tmp[@"fa-chevron-right"]  = @(FAIconChevronRight);
        tmp[@"fa-plus-sign"]      = @(FAIconPlusSign);
        tmp[@"fa-minus-sign"]     = @(FAIconMinusSign);
        tmp[@"fa-remove-sign"]    = @(FAIconRemoveSign);
        tmp[@"fa-ok-sign"]        = @(FAIconOkSign);
        tmp[@"fa-question-sign"]  = @(FAIconQuestionSign);
        tmp[@"fa-info-sign"]      = @(FAIconInfoSign);
        tmp[@"fa-screenshot"]     = @(FAIconScreenshot);
        tmp[@"fa-remove-circle"]  = @(FAIconRemoveCircle);
        tmp[@"fa-ok-circle"]      = @(FAIconOkCircle);
        tmp[@"fa-ban-circle"]     = @(FAIconBanCircle);
        tmp[@"fa-arrow-left"]     = @(FAIconArrowLeft);
        tmp[@"fa-arrow-right"]    = @(FAIconArrowRight);
        tmp[@"fa-arrow-up"]       = @(FAIconArrowUp);
        tmp[@"fa-arrow-down"]     = @(FAIconArrowDown);
        tmp[@"fa-share-alt"]      = @(FAIconShareAlt);
        tmp[@"fa-mail-forward"]   = @(FAIconMailForward);
        tmp[@"fa-resize-full"]    = @(FAIconResizeFull);
        tmp[@"fa-resize-small"]   = @(FAIconResizeSmall);
        tmp[@"fa-plus"]           = @(FAIconPlus);
        tmp[@"fa-minus"]          = @(FAIconMinus);
        tmp[@"fa-asterisk"]       = @(FAIconAsterisk);
        tmp[@"fa-exclamation-sign"]       = @(FAIconExclamationSign);
        tmp[@"fa-gift"]           = @(FAIconGift);
        tmp[@"fa-leaf"]           = @(FAIconLeaf);
        tmp[@"fa-fire"]           = @(FAIconFire);
        tmp[@"fa-eye-open"]       = @(FAIconEyeOpen);
        tmp[@"fa-eye-close"]      = @(FAIconEyeClose);
        tmp[@"fa-warning-sign"]   = @(FAIconWarningSign);
        tmp[@"fa-plane"]          = @(FAIconPlane);
        tmp[@"fa-calendar"]       = @(FAIconCalendar);
        tmp[@"fa-random"]         = @(FAIconRandom);
        tmp[@"fa-comment"]        = @(FAIconComment);
        tmp[@"fa-magnet"]         = @(FAIconMagnet);
        tmp[@"fa-chevron-up"]     = @(FAIconChevronUp);
        tmp[@"fa-chevron-down"]   = @(FAIconChevronDown);
        tmp[@"fa-retweet"]        = @(FAIconRetweet);
        tmp[@"fa-shopping-cart"]  = @(FAIconShoppingCart);
        tmp[@"fa-folder-close"]   = @(FAIconFolderClose);
        tmp[@"fa-folder-open"]    = @(FAIconFolderOpen);
        tmp[@"fa-resize-vertical"]        = @(FAIconResizeVertical);
        tmp[@"fa-resize-horizontal"]      = @(FAIconResizeHorizontal);
        tmp[@"fa-bar-chart"]              = @(FAIconBarChart);
        tmp[@"fa-twitter-sign"]   = @(FAIconTwitterSign);
        tmp[@"fa-facebook-sign"]  = @(FAIconFacebookSign);
        tmp[@"fa-camera-retro"]   = @(FAIconCameraRetro);
        tmp[@"fa-key"]            = @(FAIconKey);
        tmp[@"fa-cogs"]           = @(FAIconCogs);
        tmp[@"fa-gears"]          = @(FAIconGears);
        tmp[@"fa-comments"]       = @(FAIconComments);
        tmp[@"fa-thumbs-up-alt"]  = @(FAIconThumbsUpAlt);
        tmp[@"fa-thumbs-down-alt"]        = @(FAIconThumbsDownAlt);
        tmp[@"fa-star-half"]      = @(FAIconStarHalf);
        tmp[@"fa-heart-empty"]    = @(FAIconHeartEmpty);
        tmp[@"fa-signout"]        = @(FAIconSignout);
        tmp[@"fa-linkedin-sign"]  = @(FAIconLinkedinSign);
        tmp[@"fa-pushpin"]        = @(FAIconPushpin);
        tmp[@"fa-external-link"]  = @(FAIconExternalLink);
        tmp[@"fa-signin"]         = @(FAIconSignin);
        tmp[@"fa-trophy"]         = @(FAIconTrophy);
        tmp[@"fa-github-sign"]    = @(FAIconGithubSign);
        tmp[@"fa-upload-alt"]     = @(FAIconUploadAlt);
        tmp[@"fa-lemon"]          = @(FAIconLemon);
        tmp[@"fa-phone"]          = @(FAIconPhone);
        tmp[@"fa-check-empty"]    = @(FAIconCheckEmpty);
        tmp[@"fa-unchecked"]      = @(FAIconUnchecked);
        tmp[@"fa-bookmark-empty"] = @(FAIconBookmarkEmpty);
        tmp[@"fa-phone-sign"]     = @(FAIconPhoneSign);
        tmp[@"fa-twitter"]        = @(FAIconTwitter);
        tmp[@"fa-facebook"]       = @(FAIconFacebook);
        tmp[@"fa-github"]         = @(FAIconGithub);
        tmp[@"fa-unlock"]         = @(FAIconUnlock);
        tmp[@"fa-credit-card"]    = @(FAIconCreditCard);
        tmp[@"fa-rss"]            = @(FAIconRss);
        tmp[@"fa-hdd"]            = @(FAIconHdd);
        tmp[@"fa-bullhorn"]       = @(FAIconBullhorn);
        tmp[@"fa-bell"]           = @(FAIconBell);
        tmp[@"fa-certificate"]    = @(FAIconCertificate);
        tmp[@"fa-hand-right"]     = @(FAIconHandRight);
        tmp[@"fa-hand-left"]      = @(FAIconHandLeft);
        tmp[@"fa-hand-up"]        = @(FAIconHandUp);
        tmp[@"fa-hand-down"]      = @(FAIconHandDown);
        tmp[@"fa-circle-arrow-left"]      = @(FAIconCircleArrowLeft);
        tmp[@"fa-circle-arrow-right"]     = @(FAIconCircleArrowRight);
        tmp[@"fa-circle-arrow-up"]        = @(FAIconCircleArrowUp);
        tmp[@"fa-circle-arrow-down"]      = @(FAIconCircleArrowDown);
        tmp[@"fa-globe"]          = @(FAIconGlobe);
        tmp[@"fa-wrench"]         = @(FAIconWrench);
        tmp[@"fa-tasks"]          = @(FAIconTasks);
        tmp[@"fa-filter"]         = @(FAIconFilter);
        tmp[@"fa-briefcase"]      = @(FAIconBriefcase);
        tmp[@"fa-fullscreen"]     = @(FAIconFullscreen);
        tmp[@"fa-group"]          = @(FAIconGroup);
        tmp[@"fa-link"]           = @(FAIconLink);
        tmp[@"fa-cloud"]          = @(FAIconCloud);
        tmp[@"fa-beaker"]         = @(FAIconBeaker);
        tmp[@"fa-cut"]            = @(FAIconCut);
        tmp[@"fa-copy"]           = @(FAIconCopy);
        tmp[@"fa-paper-clip"]     = @(FAIconPaperClip);
        tmp[@"fa-save"]           = @(FAIconSave);
        tmp[@"fa-sign-blank"]     = @(FAIconSignBlank);
        tmp[@"fa-reorder"]        = @(FAIconReorder);
        tmp[@"fa-list-ul"]        = @(FAIconListUl);
        tmp[@"fa-list-ol"]        = @(FAIconListOl);
        tmp[@"fa-strikethrough"]  = @(FAIconStrikethrough);
        tmp[@"fa-underline"]      = @(FAIconUnderline);
        tmp[@"fa-table"]          = @(FAIconTable);
        tmp[@"fa-magic"]          = @(FAIconMagic);
        tmp[@"fa-truck"]          = @(FAIconTruck);
        tmp[@"fa-pinterest"]      = @(FAIconPinterest);
        tmp[@"fa-pinterest-sign"] = @(FAIconPinterestSign);
        tmp[@"fa-google-plus-sign"]       = @(FAIconGooglePlusSign);
        tmp[@"fa-google-plus"]    = @(FAIconGooglePlus);
        tmp[@"fa-money"]          = @(FAIconMoney);
        tmp[@"fa-caret-down"]     = @(FAIconCaretDown);
        tmp[@"fa-caret-up"]       = @(FAIconCaretUp);
        tmp[@"fa-caret-left"]     = @(FAIconCaretLeft);
        tmp[@"fa-caret-right"]    = @(FAIconCaretRight);
        tmp[@"fa-columns"]        = @(FAIconColumns);
        tmp[@"fa-sort"]           = @(FAIconSort);
        tmp[@"fa-sort-down"]      = @(FAIconSortDown);
        tmp[@"fa-sort-up"]        = @(FAIconSortUp);
        tmp[@"fa-envelope"]       = @(FAIconEnvelope);
        tmp[@"fa-linkedin"]       = @(FAIconLinkedin);
        tmp[@"fa-undo"]           = @(FAIconUndo);
        tmp[@"fa-rotate-left"]    = @(FAIconRotateLeft);
        tmp[@"fa-legal"]          = @(FAIconLegal);
        tmp[@"fa-dashboard"]      = @(FAIconDashboard);
        tmp[@"fa-comment-alt"]    = @(FAIconCommentAlt);
        tmp[@"fa-comments-alt"]   = @(FAIconCommentsAlt);
        tmp[@"fa-bolt"]           = @(FAIconBolt);
        tmp[@"fa-sitemap"]        = @(FAIconSitemap);
        tmp[@"fa-umbrella"]       = @(FAIconUmbrella);
        tmp[@"fa-paste"]          = @(FAIconPaste);
        tmp[@"fa-lightbulb"]      = @(FAIconLightbulb);
        tmp[@"fa-exchange"]       = @(FAIconExchange);
        tmp[@"fa-cloud-download"] = @(FAIconCloudDownload);
        tmp[@"fa-cloud-upload"]   = @(FAIconCloudUpload);
        tmp[@"fa-user-md"]        = @(FAIconUserMd);
        tmp[@"fa-stethoscope"]    = @(FAIconStethoscope);
        tmp[@"fa-suitcase"]       = @(FAIconSuitcase);
        tmp[@"fa-bell-alt"]       = @(FAIconBellAlt);
        tmp[@"fa-coffee"]         = @(FAIconCoffee);
        tmp[@"fa-food"]           = @(FAIconFood);
        tmp[@"fa-file-text-alt"]  = @(FAIconFileTextAlt);
        tmp[@"fa-building"]       = @(FAIconBuilding);
        tmp[@"fa-hospital"]       = @(FAIconHospital);
        tmp[@"fa-ambulance"]      = @(FAIconAmbulance);
        tmp[@"fa-medkit"]         = @(FAIconMedkit);
        tmp[@"fa-fighter-jet"]    = @(FAIconFighterJet);
        tmp[@"fa-beer"]           = @(FAIconBeer);
        tmp[@"fa-h-sign"]         = @(FAIconHSign);
        tmp[@"fa-plus-sign-alt"]  = @(FAIconPlusSignAlt);
        tmp[@"fa-double-angle-left"]      = @(FAIconDoubleAngleLeft);
        tmp[@"fa-double-angle-right"]     = @(FAIconDoubleAngleRight);
        tmp[@"fa-double-angle-up"]        = @(FAIconDoubleAngleUp);
        tmp[@"fa-double-angle-down"]      = @(FAIconDoubleAngleDown);
        tmp[@"fa-angle-left"]     = @(FAIconAngleLeft);
        tmp[@"fa-angle-right"]    = @(FAIconAngleRight);
        tmp[@"fa-angle-up"]       = @(FAIconAngleUp);
        tmp[@"fa-angle-down"]     = @(FAIconAngleDown);
        tmp[@"fa-desktop"]        = @(FAIconDesktop);
        tmp[@"fa-laptop"]         = @(FAIconLaptop);
        tmp[@"fa-tablet"]         = @(FAIconTablet);
        tmp[@"fa-mobile-phone"]   = @(FAIconMobilePhone);
        tmp[@"fa-circle-blank"]   = @(FAIconCircleBlank);
        tmp[@"fa-quote-left"]     = @(FAIconQuoteLeft);
        tmp[@"fa-quote-right"]    = @(FAIconQuoteRight);
        tmp[@"fa-spinner"]        = @(FAIconSpinner);
        tmp[@"fa-circle"]         = @(FAIconCircle);
        tmp[@"fa-reply"]          = @(FAIconReply);
        tmp[@"fa-mail-reply"]     = @(FAIconMailReply);
        tmp[@"fa-github-alt"]     = @(FAIconGithubAlt);
        tmp[@"fa-folder-close-alt"]       = @(FAIconFolderCloseAlt);
        tmp[@"fa-folder-open-alt"]        = @(FAIconFolderOpenAlt);
        tmp[@"fa-expand-alt"]     = @(FAIconExpandAlt);
        tmp[@"fa-collapse-alt"]   = @(FAIconCollapseAlt);
        tmp[@"fa-smile"]          = @(FAIconSmile);
        tmp[@"fa-frown"]          = @(FAIconFrown);
        tmp[@"fa-meh"]            = @(FAIconMeh);
        tmp[@"fa-gamepad"]        = @(FAIconGamepad);
        tmp[@"fa-keyboard"]       = @(FAIconKeyboard);
        tmp[@"fa-flag-alt"]       = @(FAIconFlagAlt);
        tmp[@"fa-flag-checkered"] = @(FAIconFlagCheckered);
        tmp[@"fa-terminal"]       = @(FAIconTerminal);
        tmp[@"fa-code"]           = @(FAIconCode);
        tmp[@"fa-reply-all"]      = @(FAIconReplyAll);
        tmp[@"fa-mail-reply-all"] = @(FAIconMailReplyAll);
        tmp[@"fa-star-half-empty"]        = @(FAIconStarHalfEmpty);
        tmp[@"fa-star-half-full"] = @(FAIconStarHalfFull);
        tmp[@"fa-location-arrow"] = @(FAIconLocationArrow);
        tmp[@"fa-crop"]           = @(FAIconCrop);
        tmp[@"fa-code-fork"]      = @(FAIconCodeFork);
        tmp[@"fa-unlink"]         = @(FAIconUnlink);
        tmp[@"fa-question"]       = @(FAIconQuestion);
        tmp[@"fa-info"]           = @(FAIconInfo);
        tmp[@"fa-exclamation"]    = @(FAIconExclamation);
        tmp[@"fa-superscript"]    = @(FAIconSuperscript);
        tmp[@"fa-subscript"]      = @(FAIconSubscript);
        tmp[@"fa-eraser"]         = @(FAIconEraser);
        tmp[@"fa-puzzle-piece"]   = @(FAIconPuzzlePiece);
        tmp[@"fa-microphone"]     = @(FAIconMicrophone);
        tmp[@"fa-microphone-off"] = @(FAIconMicrophoneOff);
        tmp[@"fa-shield"]         = @(FAIconShield);
        tmp[@"fa-calendar-empty"] = @(FAIconCalendarEmpty);
        tmp[@"fa-fire-extinguisher"]      = @(FAIconFireExtinguisher);
        tmp[@"fa-rocket"]         = @(FAIconRocket);
        tmp[@"fa-maxcdn"]         = @(FAIconMaxcdn);
        tmp[@"fa-chevron-sign-left"]      = @(FAIconChevronSignLeft);
        tmp[@"fa-chevron-sign-right"]     = @(FAIconChevronSignRight);
        tmp[@"fa-chevron-sign-up"]        = @(FAIconChevronSignUp);
        tmp[@"fa-chevron-sign-down"]      = @(FAIconChevronSignDown);
        tmp[@"fa-html5"]          = @(FAIconHtml5);
        tmp[@"fa-css3"]           = @(FAIconCss3);
        tmp[@"fa-anchor"]         = @(FAIconAnchor);
        tmp[@"fa-unlock-alt"]     = @(FAIconUnlockAlt);
        tmp[@"fa-bullseye"]       = @(FAIconBullseye);
        tmp[@"fa-ellipsis-horizontal"]    = @(FAIconEllipsisHorizontal);
        tmp[@"fa-ellipsis-vertical"]      = @(FAIconEllipsisVertical);
        tmp[@"fa-rss-sign"]       = @(FAIconRssSign);
        tmp[@"fa-play-sign"]      = @(FAIconPlaySign);
        tmp[@"fa-ticket"]         = @(FAIconTicket);
        tmp[@"fa-minus-sign-alt"] = @(FAIconMinusSignAlt);
        tmp[@"fa-check-minus"]    = @(FAIconCheckMinus);
        tmp[@"fa-level-up"]       = @(FAIconLevelUp);
        tmp[@"fa-level-down"]     = @(FAIconLevelDown);
        tmp[@"fa-check-sign"]     = @(FAIconCheckSign);
        tmp[@"fa-edit-sign"]      = @(FAIconEditSign);
        tmp[@"fa-external-link-sign"]     = @(FAIconExternalLinkSign);
        tmp[@"fa-share-sign"]     = @(FAIconShareSign);
        tmp[@"fa-compass"]        = @(FAIconCompass);
        tmp[@"fa-collapse"]       = @(FAIconCollapse);
        tmp[@"fa-collapse-top"]   = @(FAIconCollapseTop);
        tmp[@"fa-expand"]         = @(FAIconExpand);
        tmp[@"fa-eur"]            = @(FAIconEur);
        tmp[@"fa-euro"]           = @(FAIconEuro);
        tmp[@"fa-gbp"]            = @(FAIconGbp);
        tmp[@"fa-usd"]            = @(FAIconUsd);
        tmp[@"fa-dollar"]         = @(FAIconDollar);
        tmp[@"fa-inr"]            = @(FAIconInr);
        tmp[@"fa-rupee"]          = @(FAIconRupee);
        tmp[@"fa-jpy"]            = @(FAIconJpy);
        tmp[@"fa-yen"]            = @(FAIconYen);
        tmp[@"fa-cny"]            = @(FAIconCny);
        tmp[@"fa-renminbi"]       = @(FAIconRenminbi);
        tmp[@"fa-krw"]            = @(FAIconKrw);
        tmp[@"fa-won"]            = @(FAIconWon);
        tmp[@"fa-btc"]            = @(FAIconBtc);
        tmp[@"fa-bitcoin"]        = @(FAIconBitcoin);
        tmp[@"fa-brand-icons"]    = @(FAIconBrandIcons);
        tmp[@"fa-file"]           = @(FAIconFile);
        tmp[@"fa-file-text"]      = @(FAIconFileText);
        tmp[@"fa-sort-by-alphabet"]       = @(FAIconSortByAlphabet);
        tmp[@"fa-sort-by-alphabet-alt"]   = @(FAIconSortByAlphabetAlt);
        tmp[@"fa-sort-by-attributes"]     = @(FAIconSortByAttributes);
        tmp[@"fa-sort-by-attributes-alt"] = @(FAIconSortByAttributesAlt);
        tmp[@"fa-sort-by-order"]          = @(FAIconSortByOrder);
        tmp[@"fa-sort-by-order-alt"]      = @(FAIconSortByOrderAlt);
        tmp[@"fa-thumbs-up"]      = @(FAIconThumbsUp);
        tmp[@"fa-thumbs-down"]    = @(FAIconThumbsDown);
        tmp[@"fa-youtube-sign"]   = @(FAIconYoutubeSign);
        tmp[@"fa-youtube"]        = @(FAIconYoutube);
        tmp[@"fa-xing"]           = @(FAIconXing);
        tmp[@"fa-xing-sign"]      = @(FAIconXingSign);
        tmp[@"fa-youtube-play"]   = @(FAIconYoutubePlay);
        tmp[@"fa-dropbox"]        = @(FAIconDropbox);
        tmp[@"fa-stackexchange"]  = @(FAIconStackexchange);
        tmp[@"fa-instagram"]      = @(FAIconInstagram);
        tmp[@"fa-flickr"]         = @(FAIconFlickr);
        tmp[@"fa-adn"]            = @(FAIconAdn);
        tmp[@"fa-bitbucket"]      = @(FAIconBitbucket);
        tmp[@"fa-bitbucket-sign"] = @(FAIconBitbucketSign);
        tmp[@"fa-tumblr"]         = @(FAIconTumblr);
        tmp[@"fa-tumblr-sign"]    = @(FAIconTumblrSign);
        tmp[@"fa-long-arrow-down"]        = @(FAIconLongArrowDown);
        tmp[@"fa-long-arrow-up"]          = @(FAIconLongArrowUp);
        tmp[@"fa-long-arrow-left"]        = @(FAIconLongArrowLeft);
        tmp[@"fa-long-arrow-right"]       = @(FAIconLongArrowRight);
        tmp[@"fa-apple"]          = @(FAIconApple);
        tmp[@"fa-windows"]        = @(FAIconWindows);
        tmp[@"fa-android"]        = @(FAIconAndroid);
        tmp[@"fa-linux"]          = @(FAIconLinux);
        tmp[@"fa-dribbble"]       = @(FAIconDribbble);
        tmp[@"fa-skype"]          = @(FAIconSkype);
        tmp[@"fa-foursquare"]     = @(FAIconFoursquare);
        tmp[@"fa-trello"]         = @(FAIconTrello);
        tmp[@"fa-female"]         = @(FAIconFemale);
        tmp[@"fa-male"]           = @(FAIconMale);
        tmp[@"fa-gittip"]         = @(FAIconGittip);
        tmp[@"fa-sun"]            = @(FAIconSun);
        tmp[@"fa-moon"]           = @(FAIconMoon);
        tmp[@"fa-archive"]        = @(FAIconArchive);
        tmp[@"fa-bug"]            = @(FAIconBug);
        tmp[@"fa-vk"]             = @(FAIconVk);
        tmp[@"fa-weibo"]          = @(FAIconWeibo);
        tmp[@"fa-renren"]         = @(FAIconRenren);
        tmp[@"fa-angel-list"]     = @(FAIconAngelList);
        tmp[@"fa-bus"]     = @(FAIconBus);
        tmp[@"fa-cc-discover"]     = @(FACCDiscover);
        tmp[@"fa-google-wallet"]     = @(FAGoogleWallet);
        tmp[@"fa-last-fm-square"]     = @(FALastFMSquare);
        tmp[@"fa-paint-brush"]     = @(FAPaintBrush);
        tmp[@"fa-ils"]     = @(FAIls);
        tmp[@"fa-toggle-off"]     = @(FAToggleOff);
        tmp[@"fa-switch"]     = @(FATwitch);
        tmp[@"fa-area-chart"]     = @(FAAreaChart);
        tmp[@"fa-bicycle"]     = @(FABicycle);
        tmp[@"fa-calculator"]     = @(FACalculator);
        tmp[@"fa-cc-mastercard"]     = @(FACCMastercard);
        tmp[@"fa-copyright"]     = @(FACopyright);
        tmp[@"fa-line-chart"]     = @(FALineChart);
        tmp[@"fa-paypal"]     = @(FAPaypal);
        tmp[@"fa-toggle-on"]     = @(FAToggleOn);
        tmp[@"fa-wifi"]     = @(FAWifi);
        tmp[@"fa-at"]     = @(FAAt);
        tmp[@"fa-binoculars"]     = @(FABinoculars);
        tmp[@"fa-cc"]     = @(FACc);
        tmp[@"fa-cc-paypal"]     = @(FACcpaypal);
        tmp[@"fa-eye-dropper"]     = @(FAEyeDropper);
        tmp[@"fa-iox-host"]     = @(FAIoxHost);
        tmp[@"fa-mean-path"]     = @(FAMeanPath);
        tmp[@"fa-pie-chart"]     = @(FAPieChart);
        tmp[@"fa-slide-share"]     = @(FASlideShare);
        tmp[@"fa-trash"]     = @(FATrash);
        tmp[@"fa-yelp"]     = @(FAYelp);
        tmp[@"fa-bell-slash"]     = @(FABellSlash);
        tmp[@"fa-birthday-cake"]     = @(FABirthdayCake);
        tmp[@"fa-cc-amex"]     = @(FACCAmex);
        tmp[@"fa-cc-stripe"]     = @(FACCStripe);
        tmp[@"fa-futbol-o"]     = @(FAFutbolO);
        tmp[@"fa-last-fm"]     = @(FALastFM);
        tmp[@"fa-newspaper-o"]     = @(FANewspaperO);
        tmp[@"fa-plug"]     = @(FAPlug);
        tmp[@"fa-tty"]     = @(FATty);
		enumDictionary = tmp;
	});
    
    return enumDictionary;
}

@end
