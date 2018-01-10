# Customer Search Logic
# If search == @, search by e-mail, else search first and last name
# Case Sensitive
#Matches should include letters from the start of word, so Will will also return William
#Exact matches should have priority

class CustomerSearchTerm
  attr_reader :where_clause, :where_args, :order
  def initialize(search_terms)
    earch_term = search_term.downcase
    @where_clause = ""
    @where_args = {}
    if search_term =~ /@/
      email_address_search(search_term)
    else
      name_search(search_term)
    end
  end
end
 
