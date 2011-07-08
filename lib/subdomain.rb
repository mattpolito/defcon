class Subdomain
  RESERVED_SUBDOMAINS = %w(www admin nil)

  def self.matches?(request)
    !request.subdomain.empty? && !reserved_subdomains.include?(request.subdomain)
  end

  def self.reserved_subdomains
    RESERVED_SUBDOMAINS
  end
end
