module PostsHelper
	def check_warning(post, attribute)
		('<span class="alert">' + @post.errors.messages[attribute].last  + '<img src="'+ image_path('alert.png') + '"/></span>').html_safe if !post.errors.messages[attribute].first.nil?
	end
end
