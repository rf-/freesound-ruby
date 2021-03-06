module Freesound
  Sound = Struct.new(
    :similarity, :num_ratings, :duration, :samplerate, :preview_hq_ogg,
    :id, :preview_lq_ogg, :bitdepth, :num_comments, :filesize,
    :preview_hq_mp3, :type, :analysis_stats, :description, :tags,
    :serve, :spectral_m, :spectral_l, :user, :bitrate, :num_downloads,
    :analysis_frames, :channels, :license, :created, :url, :ref,:avg_rating, 
    :preview_lq_mp3, :original_filename, :waveform_l, :waveform_m, :pack
  )
end
