IF (ENABLE_VIDEO_TRACK)
list(APPEND WEBCORE_SRC
    html/track/AudioTrack.cpp
    html/track/AudioTrackList.cpp
    html/track/InbandGenericTextTrack.cpp
    html/track/InbandTextTrack.cpp
    html/track/InbandWebVTTTextTrack.cpp
    html/track/LoadableTextTrack.cpp
    html/track/TextTrack.cpp
    html/track/TextTrackCue.cpp
    html/track/TextTrackCueGeneric.cpp
    html/track/TextTrackCueList.cpp
    html/track/TextTrackList.cpp
    html/track/TrackBase.cpp
    html/track/TrackEvent.cpp
    html/track/TrackListBase.cpp
    html/track/WebVTTElement.cpp
    html/track/WebVTTParser.cpp
    html/track/WebVTTTokenizer.cpp
    html/track/VideoTrack.cpp
    html/track/VideoTrackList.cpp     
) 

list(APPEND IDL_SRC
    html/track/AudioTrack.idl
    html/track/AudioTrackList.idl  
    html/track/TextTrack.idl
    html/track/TextTrackCue.idl  
    html/track/TextTrackCueList.idl 
    html/track/TextTrackList.idl     
    html/track/TrackEvent.idl       
    html/track/VideoTrack.idl  
    html/track/VideoTrackList.idl
)
ENDIF()
