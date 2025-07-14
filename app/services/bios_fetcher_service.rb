# frozen_string_literal: true
require 'net/http'
require 'uri'
require 'json'

class BiosFetcherService
  BIOS_DOMAIN = ENV['BIOS_DOMAIN']
  BIOS_API_ENDPOINT = ENV['BIOS_API_ENDPOINT']

  def initialize(profiles)
    @profiles = profiles
  end

  def fetch_bios
    filtered = @profiles.select { |profile| valid_bios_url?(profile[:linkBios]) }

    filtered.map do |profile|
      bios_id = extract_bios_id(profile[:linkBios])
      next unless bios_id
      begin
        response = fetch_bio_from_api(bios_id)
        clean_biography(response)
      rescue => e
        Rails.logger.error("Failed to fetch biography for #{profile[:name]} (#{bios_id}): #{e.message}")
        nil
      end
    end.compact
  end

  private

  def valid_bios_url?(url)
    return false unless url
    uri = URI.parse(url) rescue nil
    uri && uri.host && url.start_with?(BIOS_DOMAIN)
  end

  def extract_bios_id(url)
    return nil unless url
    parts = url.split('/')
    parts.last
  end

  def fetch_bio_from_api(bios_id)
    uri = URI("#{BIOS_API_ENDPOINT}/#{bios_id}")
    res = Net::HTTP.get_response(uri)
    raise "HTTP #{res.code}" unless res.is_a?(Net::HTTPSuccess)
    JSON.parse(res.body, symbolize_names: true)
  end

  def clean_biography(bio)
    if bio.is_a?(Hash)
      bio.transform_values { |v| clean_biography(v) }
    elsif bio.is_a?(Array)
      bio.map { |v| clean_biography(v) }
    elsif bio.is_a?(String)
      bio.gsub(/<[^>]*>/, '')
    else
      bio
    end
  end
end 