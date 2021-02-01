// this unit is generated

unit FoldersToFlickrSyncrMethodsUnit;

interface

uses
  FoldersToFlickrSyncrMethodsClassesUnit;

function Get_activity_userComments(const aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_activity_userPhotos(const atimeframe_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_auth_checkToken(const aauth_token: string): IFlickrAPIMethod;
function Get_auth_getFrob: IFlickrAPIMethod;
function Get_auth_getFullToken(const amini_token: string): IFlickrAPIMethod;
function Get_auth_getToken(const afrob: string): IFlickrAPIMethod;
function Get_auth_oauth_checkToken(const aoauth_token: string): IFlickrAPIMethod;
function Get_auth_oauth_getAccessToken: IFlickrAPIMethod;
function Get_blogs_getList(const aservice_optional: string): IFlickrAPIMethod;
function Get_blogs_getServices: IFlickrAPIMethod;
function Get_blogs_postPhoto(const ablog_id_optional, aphoto_id, atitle, adescription, ablog_password_optional, aservice_optional: string): IFlickrAPIMethod;
function Get_cameras_getBrandModels(const abrand: string): IFlickrAPIMethod;
function Get_cameras_getBrands: IFlickrAPIMethod;
function Get_collections_getInfo(const acollection_id: string): IFlickrAPIMethod;
function Get_collections_getTree(const acollection_id_optional, auser_id_optional: string): IFlickrAPIMethod;
function Get_commons_getInstitutions: IFlickrAPIMethod;
function Get_contacts_getList(const afilter_optional, apage_optional, aper_page_optional, asort_optional: string): IFlickrAPIMethod;
function Get_contacts_getListRecentlyUploaded(const adate_lastupload_optional, afilter_optional: string): IFlickrAPIMethod;
function Get_contacts_getPublicList(const auser_id, apage_optional, aper_page_optional: string): IFlickrAPIMethod;
function Get_contacts_getTaggingSuggestions(const aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_favorites_add(const aphoto_id: string): IFlickrAPIMethod;
function Get_favorites_getContext(const aphoto_id, auser_id: string): IFlickrAPIMethod;
function Get_favorites_getList(const auser_id_optional, amin_fave_date_optional, amax_fave_date_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_favorites_getPublicList(const auser_id, amin_fave_date_optional, amax_fave_date_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_favorites_remove(const aphoto_id: string): IFlickrAPIMethod;
function Get_galleries_addPhoto(const agallery_id, aphoto_id, acomment_optional: string): IFlickrAPIMethod;
function Get_galleries_create(const atitle, adescription, aprimary_photo_id_optional, afull_result_optional: string): IFlickrAPIMethod;
function Get_galleries_editMeta(const agallery_id, atitle, adescription_optional: string): IFlickrAPIMethod;
function Get_galleries_editPhoto(const agallery_id, aphoto_id, acomment: string): IFlickrAPIMethod;
function Get_galleries_editPhotos(const agallery_id, aprimary_photo_id, aphoto_ids: string): IFlickrAPIMethod;
function Get_galleries_getInfo(const agallery_id: string): IFlickrAPIMethod;
function Get_galleries_getList(const auser_id, aper_page_optional, apage_optional, aprimary_photo_extras_optional: string): IFlickrAPIMethod;
function Get_galleries_getListForPhoto(const aphoto_id, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_galleries_getPhotos(const agallery_id, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_groups_browse(const acat_id_optional: string): IFlickrAPIMethod;
function Get_groups_discuss_replies_add(const agroup_id, atopic_id, amessage: string): IFlickrAPIMethod;
function Get_groups_discuss_replies_delete(const agroup_id, atopic_id, areply_id: string): IFlickrAPIMethod;
function Get_groups_discuss_replies_edit(const agroup_id, atopic_id, areply_id, amessage: string): IFlickrAPIMethod;
function Get_groups_discuss_replies_getInfo(const agroup_id, atopic_id, areply_id: string): IFlickrAPIMethod;
function Get_groups_discuss_replies_getList(const agroup_id, atopic_id, aper_page, apage_optional: string): IFlickrAPIMethod;
function Get_groups_discuss_topics_add(const agroup_id, asubject, amessage: string): IFlickrAPIMethod;
function Get_groups_discuss_topics_getInfo(const agroup_id, atopic_id: string): IFlickrAPIMethod;
function Get_groups_discuss_topics_getList(const agroup_id, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_groups_getInfo(const agroup_id, agroup_path_alias_optional, alang_optional: string): IFlickrAPIMethod;
function Get_groups_join(const agroup_id, aaccept_rules_optional: string): IFlickrAPIMethod;
function Get_groups_joinRequest(const agroup_id, amessage, aaccept_rules: string): IFlickrAPIMethod;
function Get_groups_leave(const agroup_id, adelete_photos_optional: string): IFlickrAPIMethod;
function Get_groups_members_getList(const agroup_id, amembertypes_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_groups_pools_add(const aphoto_id, agroup_id: string): IFlickrAPIMethod;
function Get_groups_pools_getContext(const aphoto_id, agroup_id: string): IFlickrAPIMethod;
function Get_groups_pools_getGroups(const apage_optional, aper_page_optional: string): IFlickrAPIMethod;
function Get_groups_pools_getPhotos(const agroup_id, atags_optional, auser_id_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_groups_pools_remove(const aphoto_id, agroup_id: string): IFlickrAPIMethod;
function Get_groups_search(const atext, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_interestingness_getList(const adate_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_machinetags_getNamespaces(const apredicate_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_machinetags_getPairs(const anamespace_optional, apredicate_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_machinetags_getPredicates(const anamespace_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_machinetags_getRecentValues(const anamespace_optional, apredicate_optional, aadded_since_optional: string): IFlickrAPIMethod;
function Get_machinetags_getValues(const anamespace, apredicate, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_panda_getList: IFlickrAPIMethod;
function Get_panda_getPhotos(const apanda_name, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_people_findByEmail(const afind_email: string): IFlickrAPIMethod;
function Get_people_findByUsername(const ausername: string): IFlickrAPIMethod;
function Get_people_getGroups(const auser_id, aextras_optional: string): IFlickrAPIMethod;
function Get_people_getInfo(const auser_id: string): IFlickrAPIMethod;
function Get_people_getLimits: IFlickrAPIMethod;
function Get_people_getPhotos(const auser_id, asafe_search_optional, amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional, acontent_type_optional, aprivacy_filter_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_people_getPhotosOf(const auser_id, aowner_id_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_people_getPublicGroups(const auser_id, ainvitation_only_optional: string): IFlickrAPIMethod;
function Get_people_getPublicPhotos(const auser_id, asafe_search_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_people_getUploadStatus: IFlickrAPIMethod;
function Get_photos_addTags(const aphoto_id, atags: string): IFlickrAPIMethod;
function Get_photos_comments_addComment(const aphoto_id, acomment_text: string): IFlickrAPIMethod;
function Get_photos_comments_deleteComment(const acomment_id: string): IFlickrAPIMethod;
function Get_photos_comments_editComment(const acomment_id, acomment_text: string): IFlickrAPIMethod;
function Get_photos_comments_getList(const aphoto_id, amin_comment_date_optional, amax_comment_date_optional: string): IFlickrAPIMethod;
function Get_photos_comments_getRecentForContacts(const adate_lastcomment_optional, acontacts_filter_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_photos_delete(const aphoto_id: string): IFlickrAPIMethod;
function Get_photos_geo_batchCorrectLocation(const alat, alon, aaccuracy, aplace_id_optional, awoe_id_optional: string): IFlickrAPIMethod;
function Get_photos_geo_correctLocation(const aphoto_id, aplace_id_optional, awoe_id_optional, afoursquare_id: string): IFlickrAPIMethod;
function Get_photos_geo_getLocation(const aphoto_id, aextras_optional: string): IFlickrAPIMethod;
function Get_photos_geo_getPerms(const aphoto_id: string): IFlickrAPIMethod;
function Get_photos_geo_photosForLocation(const alat, alon, aaccuracy_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_photos_geo_removeLocation(const aphoto_id: string): IFlickrAPIMethod;
function Get_photos_geo_setContext(const aphoto_id, acontext: string): IFlickrAPIMethod;
function Get_photos_geo_setLocation(const aphoto_id, alat, alon, aaccuracy_optional, acontext_optional: string): IFlickrAPIMethod;
function Get_photos_geo_setPerms(const ais_public, ais_contact, ais_friend, ais_family, aphoto_id: string): IFlickrAPIMethod;
function Get_photos_getAllContexts(const aphoto_id: string): IFlickrAPIMethod;
function Get_photos_getContactsPhotos(const acount_optional, ajust_friends_optional, asingle_photo_optional, ainclude_self_optional, aextras_optional: string): IFlickrAPIMethod;
function Get_photos_getContactsPublicPhotos(const auser_id, acount_optional, ajust_friends_optional, asingle_photo_optional, ainclude_self_optional, aextras_optional: string): IFlickrAPIMethod;
function Get_photos_getContext(const aphoto_id: string): IFlickrAPIMethod;
function Get_photos_getCounts(const adates_optional, ataken_dates_optional: string): IFlickrAPIMethod;
function Get_photos_getExif(const aphoto_id, asecret_optional: string): IFlickrAPIMethod;
function Get_photos_getFavorites(const aphoto_id, apage_optional, aper_page_optional: string): IFlickrAPIMethod;
function Get_photos_getInfo(const aphoto_id, asecret_optional: string): IFlickrAPIMethod;
function Get_photos_getNotInSet(const amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional, aprivacy_filter_optional, amedia_optional, amin_upload_date_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_photos_getPerms(const aphoto_id: string): IFlickrAPIMethod;
function Get_photos_getRecent(const aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_photos_getSizes(const aphoto_id: string): IFlickrAPIMethod;
function Get_photos_getUntagged(const amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional, aprivacy_filter_optional, amedia_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_photos_getWithGeoData(const amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional, aprivacy_filter_optional, asort_optional, amedia_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_photos_getWithoutGeoData(const amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional, aprivacy_filter_optional, asort_optional, amedia_optional, amin_upload_date_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_photos_licenses_getInfo: IFlickrAPIMethod;
function Get_photos_licenses_setLicense(const aphoto_id, alicense_id: string): IFlickrAPIMethod;
function Get_photos_notes_add(const aphoto_id, anote_x, anote_y, anote_w, anote_h, anote_text: string): IFlickrAPIMethod;
function Get_photos_notes_delete(const anote_id: string): IFlickrAPIMethod;
function Get_photos_notes_edit(const anote_id, anote_x, anote_y, anote_w, anote_h, anote_text: string): IFlickrAPIMethod;
function Get_photos_people_add(const aphoto_id, auser_id, aperson_x_optional, aperson_y_optional, aperson_w_optional, aperson_h_optional: string): IFlickrAPIMethod;
function Get_photos_people_delete(const aphoto_id, auser_id: string): IFlickrAPIMethod;
function Get_photos_people_deleteCoords(const aphoto_id, auser_id: string): IFlickrAPIMethod;
function Get_photos_people_editCoords(const aphoto_id, auser_id, aperson_x, aperson_y, aperson_w, aperson_h: string): IFlickrAPIMethod;
function Get_photos_people_getList(const aphoto_id: string): IFlickrAPIMethod;
function Get_photos_recentlyUpdated(const amin_date, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_photos_removeTag(const atag_id: string): IFlickrAPIMethod;
function Get_photos_search(const auser_id_optional, atags_optional, atag_mode_optional, atext_optional, amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional, alicense_optional, asort_optional, aprivacy_filter_optional, abbox_optional, aaccuracy_optional, asafe_search_optional, acontent_type_optional, amachine_tags_optional, amachine_tag_mode_optional, agroup_id_optional, acontacts_optional, awoe_id_optional, aplace_id_optional, amedia_optional, ahas_geo_optional, ageo_context_optional, alat_optional, alon_optional, aradius_optional, aradius_units_optional, ais_commons_optional, ain_gallery_optional, ais_getty_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_photos_setContentType(const aphoto_id, acontent_type: string): IFlickrAPIMethod;
function Get_photos_setDates(const aphoto_id, adate_posted_optional, adate_taken_optional, adate_taken_granularity_optional: string): IFlickrAPIMethod;
function Get_photos_setMeta(const aphoto_id, atitle_optional, adescription_optional: string): IFlickrAPIMethod;
function Get_photos_setPerms(const aphoto_id, ais_public, ais_friend, ais_family, aperm_comment_optional, aperm_addmeta_optional: string): IFlickrAPIMethod;
function Get_photos_setSafetyLevel(const aphoto_id, asafety_level_optional, ahidden_optional: string): IFlickrAPIMethod;
function Get_photos_setTags(const aphoto_id, atags: string): IFlickrAPIMethod;
function Get_photos_suggestions_approveSuggestion(const asuggestion_id: string): IFlickrAPIMethod;
function Get_photos_suggestions_getList(const aphoto_id_optional, astatus_id_optional: string): IFlickrAPIMethod;
function Get_photos_suggestions_rejectSuggestion(const asuggestion_id: string): IFlickrAPIMethod;
function Get_photos_suggestions_removeSuggestion(const asuggestion_id: string): IFlickrAPIMethod;
function Get_photos_suggestions_suggestLocation(const aphoto_id, alat, alon, aaccuracy_optional, awoe_id_optional, aplace_id_optional, anote_optional: string): IFlickrAPIMethod;
function Get_photos_transform_rotate(const aphoto_id, adegrees: string): IFlickrAPIMethod;
function Get_photos_upload_checkTickets(const atickets: string): IFlickrAPIMethod;
function Get_photosets_addPhoto(const aphotoset_id, aphoto_id: string): IFlickrAPIMethod;
function Get_photosets_comments_addComment(const aphotoset_id, acomment_text: string): IFlickrAPIMethod;
function Get_photosets_comments_deleteComment(const acomment_id: string): IFlickrAPIMethod;
function Get_photosets_comments_editComment(const acomment_id, acomment_text: string): IFlickrAPIMethod;
function Get_photosets_comments_getList(const aphotoset_id: string): IFlickrAPIMethod;
function Get_photosets_create(const atitle, adescription_optional, aprimary_photo_id: string): IFlickrAPIMethod;
function Get_photosets_delete(const aphotoset_id: string): IFlickrAPIMethod;
function Get_photosets_editMeta(const aphotoset_id, atitle, adescription_optional: string): IFlickrAPIMethod;
function Get_photosets_editPhotos(const aphotoset_id, aprimary_photo_id, aphoto_ids: string): IFlickrAPIMethod;
function Get_photosets_getContext(const aphoto_id, aphotoset_id: string): IFlickrAPIMethod;
function Get_photosets_getInfo(const aphotoset_id, auser_id: string): IFlickrAPIMethod;
function Get_photosets_getList(const auser_id_optional, apage_optional, aper_page_optional, aprimary_photo_extras_optional: string): IFlickrAPIMethod;
function Get_photosets_getPhotos(const aphotoset_id, auser_id, aextras_optional, aper_page_optional, apage_optional, aprivacy_filter_optional, amedia_optional: string): IFlickrAPIMethod;
function Get_photosets_orderSets(const aphotoset_ids: string): IFlickrAPIMethod;
function Get_photosets_removePhoto(const aphotoset_id, aphoto_id: string): IFlickrAPIMethod;
function Get_photosets_removePhotos(const aphotoset_id, aphoto_ids: string): IFlickrAPIMethod;
function Get_photosets_reorderPhotos(const aphotoset_id, aphoto_ids: string): IFlickrAPIMethod;
function Get_photosets_setPrimaryPhoto(const aphotoset_id, aphoto_id: string): IFlickrAPIMethod;
function Get_places_find(const aquery: string): IFlickrAPIMethod;
function Get_places_findByLatLon(const alat, alon, aaccuracy_optional: string): IFlickrAPIMethod;
function Get_places_getChildrenWithPhotosPublic(const aplace_id_optional, awoe_id_optional: string): IFlickrAPIMethod;
function Get_places_getInfo(const aplace_id_optional, awoe_id_optional: string): IFlickrAPIMethod;
function Get_places_getInfoByUrl(const aurl: string): IFlickrAPIMethod;
function Get_places_getPlaceTypes: IFlickrAPIMethod;
function Get_places_getShapeHistory(const aplace_id_optional, awoe_id_optional: string): IFlickrAPIMethod;
function Get_places_getTopPlacesList(const aplace_type_id, adate_optional, awoe_id_optional, aplace_id_optional: string): IFlickrAPIMethod;
function Get_places_placesForBoundingBox(const abbox, aplace_type_optional, aplace_type_id_optional: string): IFlickrAPIMethod;
function Get_places_placesForContacts(const aplace_type_optional, aplace_type_id_optional, awoe_id_optional, aplace_id_optional, athreshold_optional, acontacts_optional, amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional: string): IFlickrAPIMethod;
function Get_places_placesForTags(const aplace_type_id, awoe_id_optional, aplace_id_optional, athreshold_optional, atags_optional, atag_mode_optional, amachine_tags_optional, amachine_tag_mode_optional, amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional: string): IFlickrAPIMethod;
function Get_places_placesForUser(const aplace_type_id_optional, aplace_type_optional, awoe_id_optional, aplace_id_optional, athreshold_optional, amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional: string): IFlickrAPIMethod;
function Get_places_resolvePlaceId(const aplace_id: string): IFlickrAPIMethod;
function Get_places_resolvePlaceURL(const aurl: string): IFlickrAPIMethod;
function Get_places_tagsForPlace(const awoe_id_optional, aplace_id_optional, amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional: string): IFlickrAPIMethod;
function Get_prefs_getContentType: IFlickrAPIMethod;
function Get_prefs_getGeoPerms: IFlickrAPIMethod;
function Get_prefs_getHidden: IFlickrAPIMethod;
function Get_prefs_getPrivacy: IFlickrAPIMethod;
function Get_prefs_getSafetyLevel: IFlickrAPIMethod;
function Get_push_getSubscriptions: IFlickrAPIMethod;
function Get_push_getTopics: IFlickrAPIMethod;
function Get_push_subscribe(const atopic, acallback, averify, averify_token_optional, alease_seconds_optional, awoe_ids_optional, aplace_ids_optional, alat_optional, alon_optional, aradius_optional, aradius_units_optional, aaccuracy_optional, ansids_optional, atags_optional: string): IFlickrAPIMethod;
function Get_push_unsubscribe(const atopic, acallback, averify, averify_token_optional: string): IFlickrAPIMethod;
function Get_reflection_getMethodInfo(const amethod_name: string): IFlickrAPIMethod;
function Get_reflection_getMethods: IFlickrAPIMethod;
function Get_stats_getCollectionDomains(const adate, acollection_id_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_stats_getCollectionReferrers(const adate, adomain, acollection_id_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_stats_getCollectionStats(const adate, acollection_id: string): IFlickrAPIMethod;
function Get_stats_getCSVFiles: IFlickrAPIMethod;
function Get_stats_getPhotoDomains(const adate, aphoto_id_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_stats_getPhotoReferrers(const adate, adomain, aphoto_id_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_stats_getPhotosetDomains(const adate, aphotoset_id_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_stats_getPhotosetReferrers(const adate, adomain, aphotoset_id_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_stats_getPhotosetStats(const adate, aphotoset_id: string): IFlickrAPIMethod;
function Get_stats_getPhotoStats(const adate, aphoto_id: string): IFlickrAPIMethod;
function Get_stats_getPhotostreamDomains(const adate, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_stats_getPhotostreamReferrers(const adate, adomain, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_stats_getPhotostreamStats(const adate: string): IFlickrAPIMethod;
function Get_stats_getPopularPhotos(const adate_optional, asort_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
function Get_stats_getTotalViews(const adate_optional: string): IFlickrAPIMethod;
function Get_tags_getClusterPhotos(const atag, acluster_id: string): IFlickrAPIMethod;
function Get_tags_getClusters(const atag: string): IFlickrAPIMethod;
function Get_tags_getHotList(const aperiod_optional, acount_optional: string): IFlickrAPIMethod;
function Get_tags_getListPhoto(const aphoto_id: string): IFlickrAPIMethod;
function Get_tags_getListUser(const auser_id_optional: string): IFlickrAPIMethod;
function Get_tags_getListUserPopular(const auser_id_optional, acount_optional: string): IFlickrAPIMethod;
function Get_tags_getListUserRaw(const atag_optional: string): IFlickrAPIMethod;
function Get_tags_getMostFrequentlyUsed: IFlickrAPIMethod;
function Get_tags_getRelated(const atag: string): IFlickrAPIMethod;
function Get_test_echo: IFlickrAPIMethod;
function Get_test_login: IFlickrAPIMethod;
function Get_test_null: IFlickrAPIMethod;
function Get_urls_getGroup(const agroup_id: string): IFlickrAPIMethod;
function Get_urls_getUserPhotos(const auser_id_optional: string): IFlickrAPIMethod;
function Get_urls_getUserProfile(const auser_id_optional: string): IFlickrAPIMethod;
function Get_urls_lookupGallery(const aurl: string): IFlickrAPIMethod;
function Get_urls_lookupGroup(const aurl: string): IFlickrAPIMethod;
function Get_urls_lookupUser(const aurl: string): IFlickrAPIMethod;

implementation



function Get_activity_userComments(const aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.activity.userComments', True, 1, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_activity_userPhotos(const atimeframe_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.activity.userPhotos', True, 1, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'timeframe';
  vArgument.Optional := True;
  vArgument.Value := atimeframe_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_auth_checkToken(const aauth_token: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.auth.checkToken', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'auth_token';
  vArgument.Optional := False;
  vArgument.Value := aauth_token;
  Result.Arguments[1] := vArgument;
end;

function Get_auth_getFrob: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.auth.getFrob', False, 0, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_auth_getFullToken(const amini_token: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.auth.getFullToken', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'mini_token';
  vArgument.Optional := False;
  vArgument.Value := amini_token;
  Result.Arguments[1] := vArgument;
end;

function Get_auth_getToken(const afrob: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.auth.getToken', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'frob';
  vArgument.Optional := False;
  vArgument.Value := afrob;
  Result.Arguments[1] := vArgument;
end;

function Get_auth_oauth_checkToken(const aoauth_token: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.auth.oauth.checkToken', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'oauth_token';
  vArgument.Optional := False;
  vArgument.Value := aoauth_token;
  Result.Arguments[1] := vArgument;
end;

function Get_auth_oauth_getAccessToken: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.auth.oauth.getAccessToken', False, 0, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_blogs_getList(const aservice_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.blogs.getList', True, 1, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'service';
  vArgument.Optional := True;
  vArgument.Value := aservice_optional;
  Result.Arguments[1] := vArgument;
end;

function Get_blogs_getServices: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.blogs.getServices', False, 0, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_blogs_postPhoto(const ablog_id_optional, aphoto_id, atitle, adescription, ablog_password_optional, aservice_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.blogs.postPhoto', True, 2, 7);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'blog_id';
  vArgument.Optional := True;
  vArgument.Value := ablog_id_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'title';
  vArgument.Optional := False;
  vArgument.Value := atitle;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'description';
  vArgument.Optional := False;
  vArgument.Value := adescription;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'blog_password';
  vArgument.Optional := True;
  vArgument.Value := ablog_password_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'service';
  vArgument.Optional := True;
  vArgument.Value := aservice_optional;
  Result.Arguments[6] := vArgument;
end;

function Get_cameras_getBrandModels(const abrand: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.cameras.getBrandModels', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'brand';
  vArgument.Optional := False;
  vArgument.Value := abrand;
  Result.Arguments[1] := vArgument;
end;

function Get_cameras_getBrands: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.cameras.getBrands', False, 0, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_collections_getInfo(const acollection_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.collections.getInfo', True, 1, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'collection_id';
  vArgument.Optional := False;
  vArgument.Value := acollection_id;
  Result.Arguments[1] := vArgument;
end;

function Get_collections_getTree(const acollection_id_optional, auser_id_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.collections.getTree', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'collection_id';
  vArgument.Optional := True;
  vArgument.Value := acollection_id_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := True;
  vArgument.Value := auser_id_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_commons_getInstitutions: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.commons.getInstitutions', False, 0, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_contacts_getList(const afilter_optional, apage_optional, aper_page_optional, asort_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.contacts.getList', True, 1, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'filter';
  vArgument.Optional := True;
  vArgument.Value := afilter_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'sort';
  vArgument.Optional := True;
  vArgument.Value := asort_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_contacts_getListRecentlyUploaded(const adate_lastupload_optional, afilter_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.contacts.getListRecentlyUploaded', True, 1, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date_lastupload';
  vArgument.Optional := True;
  vArgument.Value := adate_lastupload_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'filter';
  vArgument.Optional := True;
  vArgument.Value := afilter_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_contacts_getPublicList(const auser_id, apage_optional, aper_page_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.contacts.getPublicList', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_contacts_getTaggingSuggestions(const aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.contacts.getTaggingSuggestions', True, 1, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_favorites_add(const aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.favorites.add', True, 2, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
end;

function Get_favorites_getContext(const aphoto_id, auser_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.favorites.getContext', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[2] := vArgument;
end;

function Get_favorites_getList(const auser_id_optional, amin_fave_date_optional, amax_fave_date_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.favorites.getList', False, 0, 7);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := True;
  vArgument.Value := auser_id_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'min_fave_date';
  vArgument.Optional := True;
  vArgument.Value := amin_fave_date_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'max_fave_date';
  vArgument.Optional := True;
  vArgument.Value := amax_fave_date_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[6] := vArgument;
end;

function Get_favorites_getPublicList(const auser_id, amin_fave_date_optional, amax_fave_date_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.favorites.getPublicList', False, 0, 7);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'min_fave_date';
  vArgument.Optional := True;
  vArgument.Value := amin_fave_date_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'max_fave_date';
  vArgument.Optional := True;
  vArgument.Value := amax_fave_date_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[6] := vArgument;
end;

function Get_favorites_remove(const aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.favorites.remove', True, 2, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
end;

function Get_galleries_addPhoto(const agallery_id, aphoto_id, acomment_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.galleries.addPhoto', True, 2, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'gallery_id';
  vArgument.Optional := False;
  vArgument.Value := agallery_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'comment';
  vArgument.Optional := True;
  vArgument.Value := acomment_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_galleries_create(const atitle, adescription, aprimary_photo_id_optional, afull_result_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.galleries.create', True, 2, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'title';
  vArgument.Optional := False;
  vArgument.Value := atitle;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'description';
  vArgument.Optional := False;
  vArgument.Value := adescription;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'primary_photo_id';
  vArgument.Optional := True;
  vArgument.Value := aprimary_photo_id_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'full_result';
  vArgument.Optional := True;
  vArgument.Value := afull_result_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_galleries_editMeta(const agallery_id, atitle, adescription_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.galleries.editMeta', True, 2, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'gallery_id';
  vArgument.Optional := False;
  vArgument.Value := agallery_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'title';
  vArgument.Optional := False;
  vArgument.Value := atitle;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'description';
  vArgument.Optional := True;
  vArgument.Value := adescription_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_galleries_editPhoto(const agallery_id, aphoto_id, acomment: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.galleries.editPhoto', True, 2, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'gallery_id';
  vArgument.Optional := False;
  vArgument.Value := agallery_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'comment';
  vArgument.Optional := False;
  vArgument.Value := acomment;
  Result.Arguments[3] := vArgument;
end;

function Get_galleries_editPhotos(const agallery_id, aprimary_photo_id, aphoto_ids: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.galleries.editPhotos', True, 2, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'gallery_id';
  vArgument.Optional := False;
  vArgument.Value := agallery_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'primary_photo_id';
  vArgument.Optional := False;
  vArgument.Value := aprimary_photo_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'photo_ids';
  vArgument.Optional := False;
  vArgument.Value := aphoto_ids;
  Result.Arguments[3] := vArgument;
end;

function Get_galleries_getInfo(const agallery_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.galleries.getInfo', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'gallery_id';
  vArgument.Optional := False;
  vArgument.Value := agallery_id;
  Result.Arguments[1] := vArgument;
end;

function Get_galleries_getList(const auser_id, aper_page_optional, apage_optional, aprimary_photo_extras_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.galleries.getList', False, 0, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'primary_photo_extras';
  vArgument.Optional := True;
  vArgument.Value := aprimary_photo_extras_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_galleries_getListForPhoto(const aphoto_id, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.galleries.getListForPhoto', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_galleries_getPhotos(const agallery_id, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.galleries.getPhotos', False, 0, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'gallery_id';
  vArgument.Optional := False;
  vArgument.Value := agallery_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_groups_browse(const acat_id_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.browse', True, 1, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'cat_id';
  vArgument.Optional := True;
  vArgument.Value := acat_id_optional;
  Result.Arguments[1] := vArgument;
end;

function Get_groups_discuss_replies_add(const agroup_id, atopic_id, amessage: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.discuss.replies.add', True, 2, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'topic_id';
  vArgument.Optional := False;
  vArgument.Value := atopic_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'message';
  vArgument.Optional := False;
  vArgument.Value := amessage;
  Result.Arguments[3] := vArgument;
end;

function Get_groups_discuss_replies_delete(const agroup_id, atopic_id, areply_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.discuss.replies.delete', True, 3, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'topic_id';
  vArgument.Optional := False;
  vArgument.Value := atopic_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'reply_id';
  vArgument.Optional := False;
  vArgument.Value := areply_id;
  Result.Arguments[3] := vArgument;
end;

function Get_groups_discuss_replies_edit(const agroup_id, atopic_id, areply_id, amessage: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.discuss.replies.edit', True, 2, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'topic_id';
  vArgument.Optional := False;
  vArgument.Value := atopic_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'reply_id';
  vArgument.Optional := False;
  vArgument.Value := areply_id;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'message';
  vArgument.Optional := False;
  vArgument.Value := amessage;
  Result.Arguments[4] := vArgument;
end;

function Get_groups_discuss_replies_getInfo(const agroup_id, atopic_id, areply_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.discuss.replies.getInfo', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'topic_id';
  vArgument.Optional := False;
  vArgument.Value := atopic_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'reply_id';
  vArgument.Optional := False;
  vArgument.Value := areply_id;
  Result.Arguments[3] := vArgument;
end;

function Get_groups_discuss_replies_getList(const agroup_id, atopic_id, aper_page, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.discuss.replies.getList', False, 0, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'topic_id';
  vArgument.Optional := False;
  vArgument.Value := atopic_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := False;
  vArgument.Value := aper_page;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_groups_discuss_topics_add(const agroup_id, asubject, amessage: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.discuss.topics.add', True, 2, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'subject';
  vArgument.Optional := False;
  vArgument.Value := asubject;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'message';
  vArgument.Optional := False;
  vArgument.Value := amessage;
  Result.Arguments[3] := vArgument;
end;

function Get_groups_discuss_topics_getInfo(const agroup_id, atopic_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.discuss.topics.getInfo', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'topic_id';
  vArgument.Optional := False;
  vArgument.Value := atopic_id;
  Result.Arguments[2] := vArgument;
end;

function Get_groups_discuss_topics_getList(const agroup_id, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.discuss.topics.getList', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_groups_getInfo(const agroup_id, agroup_path_alias_optional, alang_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.getInfo', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'group_path_alias';
  vArgument.Optional := True;
  vArgument.Value := agroup_path_alias_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'lang';
  vArgument.Optional := True;
  vArgument.Value := alang_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_groups_join(const agroup_id, aaccept_rules_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.join', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'accept_rules';
  vArgument.Optional := True;
  vArgument.Value := aaccept_rules_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_groups_joinRequest(const agroup_id, amessage, aaccept_rules: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.joinRequest', True, 2, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'message';
  vArgument.Optional := False;
  vArgument.Value := amessage;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'accept_rules';
  vArgument.Optional := False;
  vArgument.Value := aaccept_rules;
  Result.Arguments[3] := vArgument;
end;

function Get_groups_leave(const agroup_id, adelete_photos_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.leave', True, 3, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'delete_photos';
  vArgument.Optional := True;
  vArgument.Value := adelete_photos_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_groups_members_getList(const agroup_id, amembertypes_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.members.getList', True, 1, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'membertypes';
  vArgument.Optional := True;
  vArgument.Value := amembertypes_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_groups_pools_add(const aphoto_id, agroup_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.pools.add', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[2] := vArgument;
end;

function Get_groups_pools_getContext(const aphoto_id, agroup_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.pools.getContext', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[2] := vArgument;
end;

function Get_groups_pools_getGroups(const apage_optional, aper_page_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.pools.getGroups', True, 1, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_groups_pools_getPhotos(const agroup_id, atags_optional, auser_id_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.pools.getPhotos', False, 0, 7);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'tags';
  vArgument.Optional := True;
  vArgument.Value := atags_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := True;
  vArgument.Value := auser_id_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[6] := vArgument;
end;

function Get_groups_pools_remove(const aphoto_id, agroup_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.pools.remove', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[2] := vArgument;
end;

function Get_groups_search(const atext, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.groups.search', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'text';
  vArgument.Optional := False;
  vArgument.Value := atext;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_interestingness_getList(const adate_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.interestingness.getList', False, 0, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := True;
  vArgument.Value := adate_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_machinetags_getNamespaces(const apredicate_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.machinetags.getNamespaces', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'predicate';
  vArgument.Optional := True;
  vArgument.Value := apredicate_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_machinetags_getPairs(const anamespace_optional, apredicate_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.machinetags.getPairs', False, 0, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'namespace';
  vArgument.Optional := True;
  vArgument.Value := anamespace_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'predicate';
  vArgument.Optional := True;
  vArgument.Value := apredicate_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_machinetags_getPredicates(const anamespace_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.machinetags.getPredicates', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'namespace';
  vArgument.Optional := True;
  vArgument.Value := anamespace_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_machinetags_getRecentValues(const anamespace_optional, apredicate_optional, aadded_since_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.machinetags.getRecentValues', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'namespace';
  vArgument.Optional := True;
  vArgument.Value := anamespace_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'predicate';
  vArgument.Optional := True;
  vArgument.Value := apredicate_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'added_since';
  vArgument.Optional := True;
  vArgument.Value := aadded_since_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_machinetags_getValues(const anamespace, apredicate, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.machinetags.getValues', False, 0, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'namespace';
  vArgument.Optional := False;
  vArgument.Value := anamespace;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'predicate';
  vArgument.Optional := False;
  vArgument.Value := apredicate;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_panda_getList: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.panda.getList', False, 0, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_panda_getPhotos(const apanda_name, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.panda.getPhotos', False, 0, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'panda_name';
  vArgument.Optional := False;
  vArgument.Value := apanda_name;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_people_findByEmail(const afind_email: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.people.findByEmail', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'find_email';
  vArgument.Optional := False;
  vArgument.Value := afind_email;
  Result.Arguments[1] := vArgument;
end;

function Get_people_findByUsername(const ausername: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.people.findByUsername', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'username';
  vArgument.Optional := False;
  vArgument.Value := ausername;
  Result.Arguments[1] := vArgument;
end;

function Get_people_getGroups(const auser_id, aextras_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.people.getGroups', True, 1, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_people_getInfo(const auser_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.people.getInfo', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[1] := vArgument;
end;

function Get_people_getLimits: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.people.getLimits', True, 1, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_people_getPhotos(const auser_id, asafe_search_optional, amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional, acontent_type_optional, aprivacy_filter_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.people.getPhotos', False, 0, 12);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'safe_search';
  vArgument.Optional := True;
  vArgument.Value := asafe_search_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'min_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amin_upload_date_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'max_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amax_upload_date_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'min_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amin_taken_date_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'max_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amax_taken_date_optional;
  Result.Arguments[6] := vArgument;
  vArgument.Name := 'content_type';
  vArgument.Optional := True;
  vArgument.Value := acontent_type_optional;
  Result.Arguments[7] := vArgument;
  vArgument.Name := 'privacy_filter';
  vArgument.Optional := True;
  vArgument.Value := aprivacy_filter_optional;
  Result.Arguments[8] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[9] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[10] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[11] := vArgument;
end;

function Get_people_getPhotosOf(const auser_id, aowner_id_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.people.getPhotosOf', False, 0, 6);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'owner_id';
  vArgument.Optional := True;
  vArgument.Value := aowner_id_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[5] := vArgument;
end;

function Get_people_getPublicGroups(const auser_id, ainvitation_only_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.people.getPublicGroups', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'invitation_only';
  vArgument.Optional := True;
  vArgument.Value := ainvitation_only_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_people_getPublicPhotos(const auser_id, asafe_search_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.people.getPublicPhotos', False, 0, 6);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'safe_search';
  vArgument.Optional := True;
  vArgument.Value := asafe_search_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[5] := vArgument;
end;

function Get_people_getUploadStatus: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.people.getUploadStatus', True, 1, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_photos_addTags(const aphoto_id, atags: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.addTags', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'tags';
  vArgument.Optional := False;
  vArgument.Value := atags;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_comments_addComment(const aphoto_id, acomment_text: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.comments.addComment', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'comment_text';
  vArgument.Optional := False;
  vArgument.Value := acomment_text;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_comments_deleteComment(const acomment_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.comments.deleteComment', True, 2, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'comment_id';
  vArgument.Optional := False;
  vArgument.Value := acomment_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_comments_editComment(const acomment_id, acomment_text: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.comments.editComment', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'comment_id';
  vArgument.Optional := False;
  vArgument.Value := acomment_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'comment_text';
  vArgument.Optional := False;
  vArgument.Value := acomment_text;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_comments_getList(const aphoto_id, amin_comment_date_optional, amax_comment_date_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.comments.getList', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'min_comment_date';
  vArgument.Optional := True;
  vArgument.Value := amin_comment_date_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'max_comment_date';
  vArgument.Optional := True;
  vArgument.Value := amax_comment_date_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_photos_comments_getRecentForContacts(const adate_lastcomment_optional, acontacts_filter_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.comments.getRecentForContacts', True, 1, 6);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date_lastcomment';
  vArgument.Optional := True;
  vArgument.Value := adate_lastcomment_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'contacts_filter';
  vArgument.Optional := True;
  vArgument.Value := acontacts_filter_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[5] := vArgument;
end;

function Get_photos_delete(const aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.delete', True, 3, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_geo_batchCorrectLocation(const alat, alon, aaccuracy, aplace_id_optional, awoe_id_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.geo.batchCorrectLocation', True, 2, 6);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'lat';
  vArgument.Optional := False;
  vArgument.Value := alat;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'lon';
  vArgument.Optional := False;
  vArgument.Value := alon;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'accuracy';
  vArgument.Optional := False;
  vArgument.Value := aaccuracy;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_id_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'woe_id';
  vArgument.Optional := True;
  vArgument.Value := awoe_id_optional;
  Result.Arguments[5] := vArgument;
end;

function Get_photos_geo_correctLocation(const aphoto_id, aplace_id_optional, awoe_id_optional, afoursquare_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.geo.correctLocation', True, 2, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_id_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'woe_id';
  vArgument.Optional := True;
  vArgument.Value := awoe_id_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'foursquare_id';
  vArgument.Optional := False;
  vArgument.Value := afoursquare_id;
  Result.Arguments[4] := vArgument;
end;

function Get_photos_geo_getLocation(const aphoto_id, aextras_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.geo.getLocation', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_geo_getPerms(const aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.geo.getPerms', True, 1, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_geo_photosForLocation(const alat, alon, aaccuracy_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.geo.photosForLocation', True, 1, 7);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'lat';
  vArgument.Optional := False;
  vArgument.Value := alat;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'lon';
  vArgument.Optional := False;
  vArgument.Value := alon;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'accuracy';
  vArgument.Optional := True;
  vArgument.Value := aaccuracy_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[6] := vArgument;
end;

function Get_photos_geo_removeLocation(const aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.geo.removeLocation', True, 2, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_geo_setContext(const aphoto_id, acontext: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.geo.setContext', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'context';
  vArgument.Optional := False;
  vArgument.Value := acontext;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_geo_setLocation(const aphoto_id, alat, alon, aaccuracy_optional, acontext_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.geo.setLocation', True, 2, 6);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'lat';
  vArgument.Optional := False;
  vArgument.Value := alat;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'lon';
  vArgument.Optional := False;
  vArgument.Value := alon;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'accuracy';
  vArgument.Optional := True;
  vArgument.Value := aaccuracy_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'context';
  vArgument.Optional := True;
  vArgument.Value := acontext_optional;
  Result.Arguments[5] := vArgument;
end;

function Get_photos_geo_setPerms(const ais_public, ais_contact, ais_friend, ais_family, aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.geo.setPerms', True, 2, 6);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'is_public';
  vArgument.Optional := False;
  vArgument.Value := ais_public;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'is_contact';
  vArgument.Optional := False;
  vArgument.Value := ais_contact;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'is_friend';
  vArgument.Optional := False;
  vArgument.Value := ais_friend;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'is_family';
  vArgument.Optional := False;
  vArgument.Value := ais_family;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[5] := vArgument;
end;

function Get_photos_getAllContexts(const aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getAllContexts', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_getContactsPhotos(const acount_optional, ajust_friends_optional, asingle_photo_optional, ainclude_self_optional, aextras_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getContactsPhotos', True, 1, 6);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'count';
  vArgument.Optional := True;
  vArgument.Value := acount_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'just_friends';
  vArgument.Optional := True;
  vArgument.Value := ajust_friends_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'single_photo';
  vArgument.Optional := True;
  vArgument.Value := asingle_photo_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'include_self';
  vArgument.Optional := True;
  vArgument.Value := ainclude_self_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[5] := vArgument;
end;

function Get_photos_getContactsPublicPhotos(const auser_id, acount_optional, ajust_friends_optional, asingle_photo_optional, ainclude_self_optional, aextras_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getContactsPublicPhotos', False, 0, 7);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'count';
  vArgument.Optional := True;
  vArgument.Value := acount_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'just_friends';
  vArgument.Optional := True;
  vArgument.Value := ajust_friends_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'single_photo';
  vArgument.Optional := True;
  vArgument.Value := asingle_photo_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'include_self';
  vArgument.Optional := True;
  vArgument.Value := ainclude_self_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[6] := vArgument;
end;

function Get_photos_getContext(const aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getContext', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_getCounts(const adates_optional, ataken_dates_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getCounts', True, 1, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'dates';
  vArgument.Optional := True;
  vArgument.Value := adates_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'taken_dates';
  vArgument.Optional := True;
  vArgument.Value := ataken_dates_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_getExif(const aphoto_id, asecret_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getExif', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'secret';
  vArgument.Optional := True;
  vArgument.Value := asecret_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_getFavorites(const aphoto_id, apage_optional, aper_page_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getFavorites', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_photos_getInfo(const aphoto_id, asecret_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getInfo', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'secret';
  vArgument.Optional := True;
  vArgument.Value := asecret_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_getNotInSet(const amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional, aprivacy_filter_optional, amedia_optional, amin_upload_date_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getNotInSet', True, 1, 10);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'max_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amax_upload_date_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'min_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amin_taken_date_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'max_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amax_taken_date_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'privacy_filter';
  vArgument.Optional := True;
  vArgument.Value := aprivacy_filter_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'media';
  vArgument.Optional := True;
  vArgument.Value := amedia_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'min_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amin_upload_date_optional;
  Result.Arguments[6] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[7] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[8] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[9] := vArgument;
end;

function Get_photos_getPerms(const aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getPerms', True, 1, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_getRecent(const aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getRecent', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_photos_getSizes(const aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getSizes', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_getUntagged(const amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional, aprivacy_filter_optional, amedia_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getUntagged', True, 1, 10);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'min_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amin_upload_date_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'max_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amax_upload_date_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'min_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amin_taken_date_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'max_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amax_taken_date_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'privacy_filter';
  vArgument.Optional := True;
  vArgument.Value := aprivacy_filter_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'media';
  vArgument.Optional := True;
  vArgument.Value := amedia_optional;
  Result.Arguments[6] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[7] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[8] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[9] := vArgument;
end;

function Get_photos_getWithGeoData(const amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional, aprivacy_filter_optional, asort_optional, amedia_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getWithGeoData', True, 1, 11);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'min_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amin_upload_date_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'max_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amax_upload_date_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'min_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amin_taken_date_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'max_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amax_taken_date_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'privacy_filter';
  vArgument.Optional := True;
  vArgument.Value := aprivacy_filter_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'sort';
  vArgument.Optional := True;
  vArgument.Value := asort_optional;
  Result.Arguments[6] := vArgument;
  vArgument.Name := 'media';
  vArgument.Optional := True;
  vArgument.Value := amedia_optional;
  Result.Arguments[7] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[8] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[9] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[10] := vArgument;
end;

function Get_photos_getWithoutGeoData(const amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional, aprivacy_filter_optional, asort_optional, amedia_optional, amin_upload_date_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.getWithoutGeoData', True, 1, 11);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'max_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amax_upload_date_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'min_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amin_taken_date_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'max_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amax_taken_date_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'privacy_filter';
  vArgument.Optional := True;
  vArgument.Value := aprivacy_filter_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'sort';
  vArgument.Optional := True;
  vArgument.Value := asort_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'media';
  vArgument.Optional := True;
  vArgument.Value := amedia_optional;
  Result.Arguments[6] := vArgument;
  vArgument.Name := 'min_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amin_upload_date_optional;
  Result.Arguments[7] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[8] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[9] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[10] := vArgument;
end;

function Get_photos_licenses_getInfo: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.licenses.getInfo', False, 0, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_photos_licenses_setLicense(const aphoto_id, alicense_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.licenses.setLicense', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'license_id';
  vArgument.Optional := False;
  vArgument.Value := alicense_id;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_notes_add(const aphoto_id, anote_x, anote_y, anote_w, anote_h, anote_text: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.notes.add', True, 2, 7);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'note_x';
  vArgument.Optional := False;
  vArgument.Value := anote_x;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'note_y';
  vArgument.Optional := False;
  vArgument.Value := anote_y;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'note_w';
  vArgument.Optional := False;
  vArgument.Value := anote_w;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'note_h';
  vArgument.Optional := False;
  vArgument.Value := anote_h;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'note_text';
  vArgument.Optional := False;
  vArgument.Value := anote_text;
  Result.Arguments[6] := vArgument;
end;

function Get_photos_notes_delete(const anote_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.notes.delete', True, 2, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'note_id';
  vArgument.Optional := False;
  vArgument.Value := anote_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_notes_edit(const anote_id, anote_x, anote_y, anote_w, anote_h, anote_text: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.notes.edit', True, 2, 7);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'note_id';
  vArgument.Optional := False;
  vArgument.Value := anote_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'note_x';
  vArgument.Optional := False;
  vArgument.Value := anote_x;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'note_y';
  vArgument.Optional := False;
  vArgument.Value := anote_y;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'note_w';
  vArgument.Optional := False;
  vArgument.Value := anote_w;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'note_h';
  vArgument.Optional := False;
  vArgument.Value := anote_h;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'note_text';
  vArgument.Optional := False;
  vArgument.Value := anote_text;
  Result.Arguments[6] := vArgument;
end;

function Get_photos_people_add(const aphoto_id, auser_id, aperson_x_optional, aperson_y_optional, aperson_w_optional, aperson_h_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.people.add', True, 2, 7);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'person_x';
  vArgument.Optional := True;
  vArgument.Value := aperson_x_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'person_y';
  vArgument.Optional := True;
  vArgument.Value := aperson_y_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'person_w';
  vArgument.Optional := True;
  vArgument.Value := aperson_w_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'person_h';
  vArgument.Optional := True;
  vArgument.Value := aperson_h_optional;
  Result.Arguments[6] := vArgument;
end;

function Get_photos_people_delete(const aphoto_id, auser_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.people.delete', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_people_deleteCoords(const aphoto_id, auser_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.people.deleteCoords', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_people_editCoords(const aphoto_id, auser_id, aperson_x, aperson_y, aperson_w, aperson_h: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.people.editCoords', True, 2, 7);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'person_x';
  vArgument.Optional := False;
  vArgument.Value := aperson_x;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'person_y';
  vArgument.Optional := False;
  vArgument.Value := aperson_y;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'person_w';
  vArgument.Optional := False;
  vArgument.Value := aperson_w;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'person_h';
  vArgument.Optional := False;
  vArgument.Value := aperson_h;
  Result.Arguments[6] := vArgument;
end;

function Get_photos_people_getList(const aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.people.getList', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_recentlyUpdated(const amin_date, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.recentlyUpdated', True, 1, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'min_date';
  vArgument.Optional := False;
  vArgument.Value := amin_date;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_photos_removeTag(const atag_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.removeTag', True, 2, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'tag_id';
  vArgument.Optional := False;
  vArgument.Value := atag_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_search(const auser_id_optional, atags_optional, atag_mode_optional, atext_optional, amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional, alicense_optional, asort_optional, aprivacy_filter_optional, abbox_optional, aaccuracy_optional, asafe_search_optional, acontent_type_optional, amachine_tags_optional, amachine_tag_mode_optional, agroup_id_optional, acontacts_optional, awoe_id_optional, aplace_id_optional, amedia_optional, ahas_geo_optional, ageo_context_optional, alat_optional, alon_optional, aradius_optional, aradius_units_optional, ais_commons_optional, ain_gallery_optional, ais_getty_optional, aextras_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.search', False, 0, 35);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := True;
  vArgument.Value := auser_id_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'tags';
  vArgument.Optional := True;
  vArgument.Value := atags_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'tag_mode';
  vArgument.Optional := True;
  vArgument.Value := atag_mode_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'text';
  vArgument.Optional := True;
  vArgument.Value := atext_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'min_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amin_upload_date_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'max_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amax_upload_date_optional;
  Result.Arguments[6] := vArgument;
  vArgument.Name := 'min_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amin_taken_date_optional;
  Result.Arguments[7] := vArgument;
  vArgument.Name := 'max_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amax_taken_date_optional;
  Result.Arguments[8] := vArgument;
  vArgument.Name := 'license';
  vArgument.Optional := True;
  vArgument.Value := alicense_optional;
  Result.Arguments[9] := vArgument;
  vArgument.Name := 'sort';
  vArgument.Optional := True;
  vArgument.Value := asort_optional;
  Result.Arguments[10] := vArgument;
  vArgument.Name := 'privacy_filter';
  vArgument.Optional := True;
  vArgument.Value := aprivacy_filter_optional;
  Result.Arguments[11] := vArgument;
  vArgument.Name := 'bbox';
  vArgument.Optional := True;
  vArgument.Value := abbox_optional;
  Result.Arguments[12] := vArgument;
  vArgument.Name := 'accuracy';
  vArgument.Optional := True;
  vArgument.Value := aaccuracy_optional;
  Result.Arguments[13] := vArgument;
  vArgument.Name := 'safe_search';
  vArgument.Optional := True;
  vArgument.Value := asafe_search_optional;
  Result.Arguments[14] := vArgument;
  vArgument.Name := 'content_type';
  vArgument.Optional := True;
  vArgument.Value := acontent_type_optional;
  Result.Arguments[15] := vArgument;
  vArgument.Name := 'machine_tags';
  vArgument.Optional := True;
  vArgument.Value := amachine_tags_optional;
  Result.Arguments[16] := vArgument;
  vArgument.Name := 'machine_tag_mode';
  vArgument.Optional := True;
  vArgument.Value := amachine_tag_mode_optional;
  Result.Arguments[17] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := True;
  vArgument.Value := agroup_id_optional;
  Result.Arguments[18] := vArgument;
  vArgument.Name := 'contacts';
  vArgument.Optional := True;
  vArgument.Value := acontacts_optional;
  Result.Arguments[19] := vArgument;
  vArgument.Name := 'woe_id';
  vArgument.Optional := True;
  vArgument.Value := awoe_id_optional;
  Result.Arguments[20] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_id_optional;
  Result.Arguments[21] := vArgument;
  vArgument.Name := 'media';
  vArgument.Optional := True;
  vArgument.Value := amedia_optional;
  Result.Arguments[22] := vArgument;
  vArgument.Name := 'has_geo';
  vArgument.Optional := True;
  vArgument.Value := ahas_geo_optional;
  Result.Arguments[23] := vArgument;
  vArgument.Name := 'geo_context';
  vArgument.Optional := True;
  vArgument.Value := ageo_context_optional;
  Result.Arguments[24] := vArgument;
  vArgument.Name := 'lat';
  vArgument.Optional := True;
  vArgument.Value := alat_optional;
  Result.Arguments[25] := vArgument;
  vArgument.Name := 'lon';
  vArgument.Optional := True;
  vArgument.Value := alon_optional;
  Result.Arguments[26] := vArgument;
  vArgument.Name := 'radius';
  vArgument.Optional := True;
  vArgument.Value := aradius_optional;
  Result.Arguments[27] := vArgument;
  vArgument.Name := 'radius_units';
  vArgument.Optional := True;
  vArgument.Value := aradius_units_optional;
  Result.Arguments[28] := vArgument;
  vArgument.Name := 'is_commons';
  vArgument.Optional := True;
  vArgument.Value := ais_commons_optional;
  Result.Arguments[29] := vArgument;
  vArgument.Name := 'in_gallery';
  vArgument.Optional := True;
  vArgument.Value := ain_gallery_optional;
  Result.Arguments[30] := vArgument;
  vArgument.Name := 'is_getty';
  vArgument.Optional := True;
  vArgument.Value := ais_getty_optional;
  Result.Arguments[31] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[32] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[33] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[34] := vArgument;
end;

function Get_photos_setContentType(const aphoto_id, acontent_type: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.setContentType', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'content_type';
  vArgument.Optional := False;
  vArgument.Value := acontent_type;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_setDates(const aphoto_id, adate_posted_optional, adate_taken_optional, adate_taken_granularity_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.setDates', True, 2, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'date_posted';
  vArgument.Optional := True;
  vArgument.Value := adate_posted_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'date_taken';
  vArgument.Optional := True;
  vArgument.Value := adate_taken_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'date_taken_granularity';
  vArgument.Optional := True;
  vArgument.Value := adate_taken_granularity_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_photos_setMeta(const aphoto_id, atitle_optional, adescription_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.setMeta', True, 2, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'title';
  vArgument.Optional := True;
  vArgument.Value := atitle_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'description';
  vArgument.Optional := True;
  vArgument.Value := adescription_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_photos_setPerms(const aphoto_id, ais_public, ais_friend, ais_family, aperm_comment_optional, aperm_addmeta_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.setPerms', True, 2, 7);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'is_public';
  vArgument.Optional := False;
  vArgument.Value := ais_public;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'is_friend';
  vArgument.Optional := False;
  vArgument.Value := ais_friend;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'is_family';
  vArgument.Optional := False;
  vArgument.Value := ais_family;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'perm_comment';
  vArgument.Optional := True;
  vArgument.Value := aperm_comment_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'perm_addmeta';
  vArgument.Optional := True;
  vArgument.Value := aperm_addmeta_optional;
  Result.Arguments[6] := vArgument;
end;

function Get_photos_setSafetyLevel(const aphoto_id, asafety_level_optional, ahidden_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.setSafetyLevel', True, 2, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'safety_level';
  vArgument.Optional := True;
  vArgument.Value := asafety_level_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'hidden';
  vArgument.Optional := True;
  vArgument.Value := ahidden_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_photos_setTags(const aphoto_id, atags: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.setTags', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'tags';
  vArgument.Optional := False;
  vArgument.Value := atags;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_suggestions_approveSuggestion(const asuggestion_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.suggestions.approveSuggestion', True, 2, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'suggestion_id';
  vArgument.Optional := False;
  vArgument.Value := asuggestion_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_suggestions_getList(const aphoto_id_optional, astatus_id_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.suggestions.getList', True, 1, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := True;
  vArgument.Value := aphoto_id_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'status_id';
  vArgument.Optional := True;
  vArgument.Value := astatus_id_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_suggestions_rejectSuggestion(const asuggestion_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.suggestions.rejectSuggestion', True, 2, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'suggestion_id';
  vArgument.Optional := False;
  vArgument.Value := asuggestion_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_suggestions_removeSuggestion(const asuggestion_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.suggestions.removeSuggestion', True, 2, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'suggestion_id';
  vArgument.Optional := False;
  vArgument.Value := asuggestion_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photos_suggestions_suggestLocation(const aphoto_id, alat, alon, aaccuracy_optional, awoe_id_optional, aplace_id_optional, anote_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.suggestions.suggestLocation', True, 2, 8);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'lat';
  vArgument.Optional := False;
  vArgument.Value := alat;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'lon';
  vArgument.Optional := False;
  vArgument.Value := alon;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'accuracy';
  vArgument.Optional := True;
  vArgument.Value := aaccuracy_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'woe_id';
  vArgument.Optional := True;
  vArgument.Value := awoe_id_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_id_optional;
  Result.Arguments[6] := vArgument;
  vArgument.Name := 'note';
  vArgument.Optional := True;
  vArgument.Value := anote_optional;
  Result.Arguments[7] := vArgument;
end;

function Get_photos_transform_rotate(const aphoto_id, adegrees: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.transform.rotate', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'degrees';
  vArgument.Optional := False;
  vArgument.Value := adegrees;
  Result.Arguments[2] := vArgument;
end;

function Get_photos_upload_checkTickets(const atickets: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photos.upload.checkTickets', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'tickets';
  vArgument.Optional := False;
  vArgument.Value := atickets;
  Result.Arguments[1] := vArgument;
end;

function Get_photosets_addPhoto(const aphotoset_id, aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.addPhoto', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[2] := vArgument;
end;

function Get_photosets_comments_addComment(const aphotoset_id, acomment_text: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.comments.addComment', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'comment_text';
  vArgument.Optional := False;
  vArgument.Value := acomment_text;
  Result.Arguments[2] := vArgument;
end;

function Get_photosets_comments_deleteComment(const acomment_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.comments.deleteComment', True, 2, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'comment_id';
  vArgument.Optional := False;
  vArgument.Value := acomment_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photosets_comments_editComment(const acomment_id, acomment_text: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.comments.editComment', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'comment_id';
  vArgument.Optional := False;
  vArgument.Value := acomment_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'comment_text';
  vArgument.Optional := False;
  vArgument.Value := acomment_text;
  Result.Arguments[2] := vArgument;
end;

function Get_photosets_comments_getList(const aphotoset_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.comments.getList', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photosets_create(const atitle, adescription_optional, aprimary_photo_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.create', True, 2, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'title';
  vArgument.Optional := False;
  vArgument.Value := atitle;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'description';
  vArgument.Optional := True;
  vArgument.Value := adescription_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'primary_photo_id';
  vArgument.Optional := False;
  vArgument.Value := aprimary_photo_id;
  Result.Arguments[3] := vArgument;
end;

function Get_photosets_delete(const aphotoset_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.delete', True, 2, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[1] := vArgument;
end;

function Get_photosets_editMeta(const aphotoset_id, atitle, adescription_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.editMeta', True, 2, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'title';
  vArgument.Optional := False;
  vArgument.Value := atitle;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'description';
  vArgument.Optional := True;
  vArgument.Value := adescription_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_photosets_editPhotos(const aphotoset_id, aprimary_photo_id, aphoto_ids: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.editPhotos', True, 2, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'primary_photo_id';
  vArgument.Optional := False;
  vArgument.Value := aprimary_photo_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'photo_ids';
  vArgument.Optional := False;
  vArgument.Value := aphoto_ids;
  Result.Arguments[3] := vArgument;
end;

function Get_photosets_getContext(const aphoto_id, aphotoset_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.getContext', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[2] := vArgument;
end;

function Get_photosets_getInfo(const aphotoset_id, auser_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.getInfo', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[2] := vArgument;
end;

function Get_photosets_getList(const auser_id_optional, apage_optional, aper_page_optional, aprimary_photo_extras_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.getList', False, 0, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := True;
  vArgument.Value := auser_id_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'primary_photo_extras';
  vArgument.Optional := True;
  vArgument.Value := aprimary_photo_extras_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_photosets_getPhotos(const aphotoset_id, auser_id, aextras_optional, aper_page_optional, apage_optional, aprivacy_filter_optional, amedia_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.getPhotos', False, 0, 8);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := False;
  vArgument.Value := auser_id;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'extras';
  vArgument.Optional := True;
  vArgument.Value := aextras_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'privacy_filter';
  vArgument.Optional := True;
  vArgument.Value := aprivacy_filter_optional;
  Result.Arguments[6] := vArgument;
  vArgument.Name := 'media';
  vArgument.Optional := True;
  vArgument.Value := amedia_optional;
  Result.Arguments[7] := vArgument;
end;

function Get_photosets_orderSets(const aphotoset_ids: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.orderSets', True, 2, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_ids';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_ids;
  Result.Arguments[1] := vArgument;
end;

function Get_photosets_removePhoto(const aphotoset_id, aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.removePhoto', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[2] := vArgument;
end;

function Get_photosets_removePhotos(const aphotoset_id, aphoto_ids: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.removePhotos', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photo_ids';
  vArgument.Optional := False;
  vArgument.Value := aphoto_ids;
  Result.Arguments[2] := vArgument;
end;

function Get_photosets_reorderPhotos(const aphotoset_id, aphoto_ids: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.reorderPhotos', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photo_ids';
  vArgument.Optional := False;
  vArgument.Value := aphoto_ids;
  Result.Arguments[2] := vArgument;
end;

function Get_photosets_setPrimaryPhoto(const aphotoset_id, aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.photosets.setPrimaryPhoto', True, 2, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[2] := vArgument;
end;

function Get_places_find(const aquery: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.find', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'query';
  vArgument.Optional := False;
  vArgument.Value := aquery;
  Result.Arguments[1] := vArgument;
end;

function Get_places_findByLatLon(const alat, alon, aaccuracy_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.findByLatLon', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'lat';
  vArgument.Optional := False;
  vArgument.Value := alat;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'lon';
  vArgument.Optional := False;
  vArgument.Value := alon;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'accuracy';
  vArgument.Optional := True;
  vArgument.Value := aaccuracy_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_places_getChildrenWithPhotosPublic(const aplace_id_optional, awoe_id_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.getChildrenWithPhotosPublic', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_id_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'woe_id';
  vArgument.Optional := True;
  vArgument.Value := awoe_id_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_places_getInfo(const aplace_id_optional, awoe_id_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.getInfo', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_id_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'woe_id';
  vArgument.Optional := True;
  vArgument.Value := awoe_id_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_places_getInfoByUrl(const aurl: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.getInfoByUrl', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'url';
  vArgument.Optional := False;
  vArgument.Value := aurl;
  Result.Arguments[1] := vArgument;
end;

function Get_places_getPlaceTypes: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.getPlaceTypes', False, 0, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_places_getShapeHistory(const aplace_id_optional, awoe_id_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.getShapeHistory', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_id_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'woe_id';
  vArgument.Optional := True;
  vArgument.Value := awoe_id_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_places_getTopPlacesList(const aplace_type_id, adate_optional, awoe_id_optional, aplace_id_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.getTopPlacesList', False, 0, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'place_type_id';
  vArgument.Optional := False;
  vArgument.Value := aplace_type_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := True;
  vArgument.Value := adate_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'woe_id';
  vArgument.Optional := True;
  vArgument.Value := awoe_id_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_id_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_places_placesForBoundingBox(const abbox, aplace_type_optional, aplace_type_id_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.placesForBoundingBox', False, 0, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'bbox';
  vArgument.Optional := False;
  vArgument.Value := abbox;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'place_type';
  vArgument.Optional := True;
  vArgument.Value := aplace_type_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'place_type_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_type_id_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_places_placesForContacts(const aplace_type_optional, aplace_type_id_optional, awoe_id_optional, aplace_id_optional, athreshold_optional, acontacts_optional, amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.placesForContacts', True, 1, 11);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'place_type';
  vArgument.Optional := True;
  vArgument.Value := aplace_type_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'place_type_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_type_id_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'woe_id';
  vArgument.Optional := True;
  vArgument.Value := awoe_id_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_id_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'threshold';
  vArgument.Optional := True;
  vArgument.Value := athreshold_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'contacts';
  vArgument.Optional := True;
  vArgument.Value := acontacts_optional;
  Result.Arguments[6] := vArgument;
  vArgument.Name := 'min_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amin_upload_date_optional;
  Result.Arguments[7] := vArgument;
  vArgument.Name := 'max_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amax_upload_date_optional;
  Result.Arguments[8] := vArgument;
  vArgument.Name := 'min_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amin_taken_date_optional;
  Result.Arguments[9] := vArgument;
  vArgument.Name := 'max_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amax_taken_date_optional;
  Result.Arguments[10] := vArgument;
end;

function Get_places_placesForTags(const aplace_type_id, awoe_id_optional, aplace_id_optional, athreshold_optional, atags_optional, atag_mode_optional, amachine_tags_optional, amachine_tag_mode_optional, amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.placesForTags', False, 0, 13);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'place_type_id';
  vArgument.Optional := False;
  vArgument.Value := aplace_type_id;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'woe_id';
  vArgument.Optional := True;
  vArgument.Value := awoe_id_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_id_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'threshold';
  vArgument.Optional := True;
  vArgument.Value := athreshold_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'tags';
  vArgument.Optional := True;
  vArgument.Value := atags_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'tag_mode';
  vArgument.Optional := True;
  vArgument.Value := atag_mode_optional;
  Result.Arguments[6] := vArgument;
  vArgument.Name := 'machine_tags';
  vArgument.Optional := True;
  vArgument.Value := amachine_tags_optional;
  Result.Arguments[7] := vArgument;
  vArgument.Name := 'machine_tag_mode';
  vArgument.Optional := True;
  vArgument.Value := amachine_tag_mode_optional;
  Result.Arguments[8] := vArgument;
  vArgument.Name := 'min_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amin_upload_date_optional;
  Result.Arguments[9] := vArgument;
  vArgument.Name := 'max_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amax_upload_date_optional;
  Result.Arguments[10] := vArgument;
  vArgument.Name := 'min_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amin_taken_date_optional;
  Result.Arguments[11] := vArgument;
  vArgument.Name := 'max_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amax_taken_date_optional;
  Result.Arguments[12] := vArgument;
end;

function Get_places_placesForUser(const aplace_type_id_optional, aplace_type_optional, awoe_id_optional, aplace_id_optional, athreshold_optional, amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.placesForUser', True, 1, 10);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'place_type_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_type_id_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'place_type';
  vArgument.Optional := True;
  vArgument.Value := aplace_type_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'woe_id';
  vArgument.Optional := True;
  vArgument.Value := awoe_id_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_id_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'threshold';
  vArgument.Optional := True;
  vArgument.Value := athreshold_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'min_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amin_upload_date_optional;
  Result.Arguments[6] := vArgument;
  vArgument.Name := 'max_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amax_upload_date_optional;
  Result.Arguments[7] := vArgument;
  vArgument.Name := 'min_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amin_taken_date_optional;
  Result.Arguments[8] := vArgument;
  vArgument.Name := 'max_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amax_taken_date_optional;
  Result.Arguments[9] := vArgument;
end;

function Get_places_resolvePlaceId(const aplace_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.resolvePlaceId', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := False;
  vArgument.Value := aplace_id;
  Result.Arguments[1] := vArgument;
end;

function Get_places_resolvePlaceURL(const aurl: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.resolvePlaceURL', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'url';
  vArgument.Optional := False;
  vArgument.Value := aurl;
  Result.Arguments[1] := vArgument;
end;

function Get_places_tagsForPlace(const awoe_id_optional, aplace_id_optional, amin_upload_date_optional, amax_upload_date_optional, amin_taken_date_optional, amax_taken_date_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.places.tagsForPlace', False, 0, 7);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'woe_id';
  vArgument.Optional := True;
  vArgument.Value := awoe_id_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'place_id';
  vArgument.Optional := True;
  vArgument.Value := aplace_id_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'min_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amin_upload_date_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'max_upload_date';
  vArgument.Optional := True;
  vArgument.Value := amax_upload_date_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'min_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amin_taken_date_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'max_taken_date';
  vArgument.Optional := True;
  vArgument.Value := amax_taken_date_optional;
  Result.Arguments[6] := vArgument;
end;

function Get_prefs_getContentType: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.prefs.getContentType', True, 1, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_prefs_getGeoPerms: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.prefs.getGeoPerms', True, 1, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_prefs_getHidden: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.prefs.getHidden', True, 1, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_prefs_getPrivacy: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.prefs.getPrivacy', True, 1, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_prefs_getSafetyLevel: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.prefs.getSafetyLevel', True, 1, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_push_getSubscriptions: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.push.getSubscriptions', True, 1, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_push_getTopics: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.push.getTopics', False, 0, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_push_subscribe(const atopic, acallback, averify, averify_token_optional, alease_seconds_optional, awoe_ids_optional, aplace_ids_optional, alat_optional, alon_optional, aradius_optional, aradius_units_optional, aaccuracy_optional, ansids_optional, atags_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.push.subscribe', True, 1, 15);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'topic';
  vArgument.Optional := False;
  vArgument.Value := atopic;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'callback';
  vArgument.Optional := False;
  vArgument.Value := acallback;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'verify';
  vArgument.Optional := False;
  vArgument.Value := averify;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'verify_token';
  vArgument.Optional := True;
  vArgument.Value := averify_token_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'lease_seconds';
  vArgument.Optional := True;
  vArgument.Value := alease_seconds_optional;
  Result.Arguments[5] := vArgument;
  vArgument.Name := 'woe_ids';
  vArgument.Optional := True;
  vArgument.Value := awoe_ids_optional;
  Result.Arguments[6] := vArgument;
  vArgument.Name := 'place_ids';
  vArgument.Optional := True;
  vArgument.Value := aplace_ids_optional;
  Result.Arguments[7] := vArgument;
  vArgument.Name := 'lat';
  vArgument.Optional := True;
  vArgument.Value := alat_optional;
  Result.Arguments[8] := vArgument;
  vArgument.Name := 'lon';
  vArgument.Optional := True;
  vArgument.Value := alon_optional;
  Result.Arguments[9] := vArgument;
  vArgument.Name := 'radius';
  vArgument.Optional := True;
  vArgument.Value := aradius_optional;
  Result.Arguments[10] := vArgument;
  vArgument.Name := 'radius_units';
  vArgument.Optional := True;
  vArgument.Value := aradius_units_optional;
  Result.Arguments[11] := vArgument;
  vArgument.Name := 'accuracy';
  vArgument.Optional := True;
  vArgument.Value := aaccuracy_optional;
  Result.Arguments[12] := vArgument;
  vArgument.Name := 'nsids';
  vArgument.Optional := True;
  vArgument.Value := ansids_optional;
  Result.Arguments[13] := vArgument;
  vArgument.Name := 'tags';
  vArgument.Optional := True;
  vArgument.Value := atags_optional;
  Result.Arguments[14] := vArgument;
end;

function Get_push_unsubscribe(const atopic, acallback, averify, averify_token_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.push.unsubscribe', True, 1, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'topic';
  vArgument.Optional := False;
  vArgument.Value := atopic;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'callback';
  vArgument.Optional := False;
  vArgument.Value := acallback;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'verify';
  vArgument.Optional := False;
  vArgument.Value := averify;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'verify_token';
  vArgument.Optional := True;
  vArgument.Value := averify_token_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_reflection_getMethodInfo(const amethod_name: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.reflection.getMethodInfo', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'method_name';
  vArgument.Optional := False;
  vArgument.Value := amethod_name;
  Result.Arguments[1] := vArgument;
end;

function Get_reflection_getMethods: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.reflection.getMethods', False, 0, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_stats_getCollectionDomains(const adate, acollection_id_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getCollectionDomains', True, 1, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := False;
  vArgument.Value := adate;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'collection_id';
  vArgument.Optional := True;
  vArgument.Value := acollection_id_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_stats_getCollectionReferrers(const adate, adomain, acollection_id_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getCollectionReferrers', True, 1, 6);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := False;
  vArgument.Value := adate;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'domain';
  vArgument.Optional := False;
  vArgument.Value := adomain;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'collection_id';
  vArgument.Optional := True;
  vArgument.Value := acollection_id_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[5] := vArgument;
end;

function Get_stats_getCollectionStats(const adate, acollection_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getCollectionStats', True, 1, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := False;
  vArgument.Value := adate;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'collection_id';
  vArgument.Optional := False;
  vArgument.Value := acollection_id;
  Result.Arguments[2] := vArgument;
end;

function Get_stats_getCSVFiles: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getCSVFiles', True, 1, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_stats_getPhotoDomains(const adate, aphoto_id_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getPhotoDomains', True, 1, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := False;
  vArgument.Value := adate;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := True;
  vArgument.Value := aphoto_id_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_stats_getPhotoReferrers(const adate, adomain, aphoto_id_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getPhotoReferrers', True, 1, 6);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := False;
  vArgument.Value := adate;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'domain';
  vArgument.Optional := False;
  vArgument.Value := adomain;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := True;
  vArgument.Value := aphoto_id_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[5] := vArgument;
end;

function Get_stats_getPhotosetDomains(const adate, aphotoset_id_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getPhotosetDomains', True, 1, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := False;
  vArgument.Value := adate;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := True;
  vArgument.Value := aphotoset_id_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_stats_getPhotosetReferrers(const adate, adomain, aphotoset_id_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getPhotosetReferrers', True, 1, 6);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := False;
  vArgument.Value := adate;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'domain';
  vArgument.Optional := False;
  vArgument.Value := adomain;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := True;
  vArgument.Value := aphotoset_id_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[4] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[5] := vArgument;
end;

function Get_stats_getPhotosetStats(const adate, aphotoset_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getPhotosetStats', True, 1, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := False;
  vArgument.Value := adate;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photoset_id';
  vArgument.Optional := False;
  vArgument.Value := aphotoset_id;
  Result.Arguments[2] := vArgument;
end;

function Get_stats_getPhotoStats(const adate, aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getPhotoStats', True, 1, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := False;
  vArgument.Value := adate;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[2] := vArgument;
end;

function Get_stats_getPhotostreamDomains(const adate, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getPhotostreamDomains', True, 1, 4);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := False;
  vArgument.Value := adate;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[3] := vArgument;
end;

function Get_stats_getPhotostreamReferrers(const adate, adomain, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getPhotostreamReferrers', True, 1, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := False;
  vArgument.Value := adate;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'domain';
  vArgument.Optional := False;
  vArgument.Value := adomain;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_stats_getPhotostreamStats(const adate: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getPhotostreamStats', True, 1, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := False;
  vArgument.Value := adate;
  Result.Arguments[1] := vArgument;
end;

function Get_stats_getPopularPhotos(const adate_optional, asort_optional, aper_page_optional, apage_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getPopularPhotos', True, 1, 5);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := True;
  vArgument.Value := adate_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'sort';
  vArgument.Optional := True;
  vArgument.Value := asort_optional;
  Result.Arguments[2] := vArgument;
  vArgument.Name := 'per_page';
  vArgument.Optional := True;
  vArgument.Value := aper_page_optional;
  Result.Arguments[3] := vArgument;
  vArgument.Name := 'page';
  vArgument.Optional := True;
  vArgument.Value := apage_optional;
  Result.Arguments[4] := vArgument;
end;

function Get_stats_getTotalViews(const adate_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.stats.getTotalViews', True, 1, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'date';
  vArgument.Optional := True;
  vArgument.Value := adate_optional;
  Result.Arguments[1] := vArgument;
end;

function Get_tags_getClusterPhotos(const atag, acluster_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.tags.getClusterPhotos', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'tag';
  vArgument.Optional := False;
  vArgument.Value := atag;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'cluster_id';
  vArgument.Optional := False;
  vArgument.Value := acluster_id;
  Result.Arguments[2] := vArgument;
end;

function Get_tags_getClusters(const atag: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.tags.getClusters', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'tag';
  vArgument.Optional := False;
  vArgument.Value := atag;
  Result.Arguments[1] := vArgument;
end;

function Get_tags_getHotList(const aperiod_optional, acount_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.tags.getHotList', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'period';
  vArgument.Optional := True;
  vArgument.Value := aperiod_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'count';
  vArgument.Optional := True;
  vArgument.Value := acount_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_tags_getListPhoto(const aphoto_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.tags.getListPhoto', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'photo_id';
  vArgument.Optional := False;
  vArgument.Value := aphoto_id;
  Result.Arguments[1] := vArgument;
end;

function Get_tags_getListUser(const auser_id_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.tags.getListUser', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := True;
  vArgument.Value := auser_id_optional;
  Result.Arguments[1] := vArgument;
end;

function Get_tags_getListUserPopular(const auser_id_optional, acount_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.tags.getListUserPopular', False, 0, 3);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := True;
  vArgument.Value := auser_id_optional;
  Result.Arguments[1] := vArgument;
  vArgument.Name := 'count';
  vArgument.Optional := True;
  vArgument.Value := acount_optional;
  Result.Arguments[2] := vArgument;
end;

function Get_tags_getListUserRaw(const atag_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.tags.getListUserRaw', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'tag';
  vArgument.Optional := True;
  vArgument.Value := atag_optional;
  Result.Arguments[1] := vArgument;
end;

function Get_tags_getMostFrequentlyUsed: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.tags.getMostFrequentlyUsed', True, 1, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_tags_getRelated(const atag: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.tags.getRelated', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'tag';
  vArgument.Optional := False;
  vArgument.Value := atag;
  Result.Arguments[1] := vArgument;
end;

function Get_test_echo: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.test.echo', False, 0, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_test_login: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.test.login', True, 1, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_test_null: IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.test.null', True, 1, 1);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
end;

function Get_urls_getGroup(const agroup_id: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.urls.getGroup', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'group_id';
  vArgument.Optional := False;
  vArgument.Value := agroup_id;
  Result.Arguments[1] := vArgument;
end;

function Get_urls_getUserPhotos(const auser_id_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.urls.getUserPhotos', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := True;
  vArgument.Value := auser_id_optional;
  Result.Arguments[1] := vArgument;
end;

function Get_urls_getUserProfile(const auser_id_optional: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.urls.getUserProfile', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'user_id';
  vArgument.Optional := True;
  vArgument.Value := auser_id_optional;
  Result.Arguments[1] := vArgument;
end;

function Get_urls_lookupGallery(const aurl: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.urls.lookupGallery', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'url';
  vArgument.Optional := False;
  vArgument.Value := aurl;
  Result.Arguments[1] := vArgument;
end;

function Get_urls_lookupGroup(const aurl: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.urls.lookupGroup', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'url';
  vArgument.Optional := False;
  vArgument.Value := aurl;
  Result.Arguments[1] := vArgument;
end;

function Get_urls_lookupUser(const aurl: string): IFlickrAPIMethod;
var
  vArgument: TFlickrAPIArgument;
begin
  Result := TFlickrAPIMethod.Create('flickr.urls.lookupUser', False, 0, 2);
  vArgument.Name := 'api_key';
  vArgument.Optional := False;
  Result.Arguments[0] := vArgument;
  vArgument.Name := 'url';
  vArgument.Optional := False;
  vArgument.Value := aurl;
  Result.Arguments[1] := vArgument;
end;

end.
