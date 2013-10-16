# @see https://developers.podio.com/doc/stream
class Podio::StreamActivityGroup < ActivePodio::Base

  property :kind, :string
  property :type, :string
  property :created_on, :datetime
  property :activities, :array

  has_one :data_ref, :class => 'Reference'
  has_one :created_by, :class => 'ByLine'
  has_one :created_via, :class => 'Via'

  has_many :authors, :class => 'ByLine'

  class << self

    def find_by_ref(ref_type, ref_id, options = {})
      list Podio.connection.get { |req|
        req.url("/stream/#{ref_type}/#{ref_id}/v3", options)
      }.body
    end

  end

end