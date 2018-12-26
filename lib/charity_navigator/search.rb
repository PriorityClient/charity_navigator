require 'json'

module CharityNavigator
  class Search

    attr_accessor :search_url, :search_params

    def initialize(opts={})
      raise EmptySearch, 'Search cannot be blank' if opts[:search].to_s.length < 1

      self.search_url = File.join(CharityNavigator.base_url, 'Organizations')

      self.search_params = {
        pageSize: opts[:page_size] || 100,
        pageNum: opts[:page_num] || 1,
        search: opts[:search],
        searchType: opts[:search_type] || 'DEFAULT',
        rated: opts[:rated],
        categoryID: opts[:category_id],
        causeID: opts[:cause_id],
        fundraisingOrgs: opts[:fundraising_orgs],
        state: opts[:state],
        city: opts[:city],
        zip: opts[:zip],
        minRating: opts[:min_rating],
        maxRating: opts[:max_rating],
        sizeRange: opts[:size_range],
        donorPrivacy: opts[:donor_privacy],
        scopeOfWork: opts[:scope_of_work],
        cfcCharities: opts[:cfc_charities],
        noGovSupport: opts[:no_gov_support],
        sort: opts[:sort] || 'RELEVANCE:DESC',
      }.
      merge(CharityNavigator.auth_params).
      delete_if{ |k,v| v.nil? }

    end

    def perform!
      uri = URI(self.search_url)
      uri.query = URI.encode_www_form(self.search_params)
      resp = Net::HTTP.get_response(uri)

      if resp.is_a?(Net::HTTPSuccess)
        return JSON.parse(resp.body)
      else
        return []
      end
    end

    class EmptySearch < StandardError

    end

  end
end
