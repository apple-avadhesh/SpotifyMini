//
//  AuthScope.swift
//  SpotifyMini
//
//  Created by Avadhesh Sharma on 15/10/24.
//

// MARK: https://developer.spotify.com/documentation/web-api/concepts/scopes

enum AuthScope: String {

  // Images
  case ugcImageUpload = "ugc-image-upload"

  // Spotify Connect
  case userReadPlaybackState = "user-read-playback-state"
  case userModifyPlaybackState = "user-modify-playback-state"
  case userReadCurrentlyPlaying = "user-read-currently-playing"

  // Playback
  case appRemoteControl = "app-remote-control"
  case streaming = "streaming"

  // Playlists
  case playlistReadPrivate = "playlist-read-private"
  case playlistReadCollaborative = "playlist-read-collaborative"
  case playlistModifyPrivate = "playlist-modify-private"
  case playlistModifyPublic = "playlist-modify-public"

  // Follow
  case userFollowRead = "user-follow-read"
  case userFollowModify = "user-follow-modify"

  // Listening History
  case userReadPlayBackPosition = "user-read-playback-position"
  case userTopRead = "user-top-read"
  case userReadRecentlyPlayed = "user-read-recently-played"

  // Library
  case userLibraryRead = "user-library-read"
  case userLibraryModify = "user-library-modify"

  // Users
  case userReadEmail = "user-read-email"
  case userReadPrivate = "user-read-private"

  // Open Access
  case usersoalink = "user-soa-link"
  case usersoaunlink = "user-soa-unlink"
  case soamanageentitlements = "soa-manage-entitlements"
  case soamanagepartner = "soa-manage-partner"
  case soacreatepartner = "soa-create-partner"
}
