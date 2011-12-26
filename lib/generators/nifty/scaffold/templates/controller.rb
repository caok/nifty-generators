class <%= plural_class_name %>Controller < AuthorizedController
  inherit_resources

  protected
    def collection
      @q = end_of_association_chain.search(params[:q])
      @<%= instances_name %> = @q.result.page(params[:page])
    end
end
