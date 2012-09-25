module ApplicationHelper
	RESULT_PER_PAGE = 10
	def slice_page(vector,url)
		@tot_pages=(vector.size)/RESULT_PER_PAGE+((vector.size)%RESULT_PER_PAGE!=0 ? 1 : 0)
		params[:page].nil? ? @page=0 : @page=params[:page].to_i
		@next_page = @page<(@tot_pages-1) ? "#{url}?page=#{@page+1}" : "#"
		@prev_page = @page>0 ?  "#{url}?page=#{@page-1}" : "#"
		vector[@page*RESULT_PER_PAGE..@page*RESULT_PER_PAGE+RESULT_PER_PAGE-1]
	end
end
