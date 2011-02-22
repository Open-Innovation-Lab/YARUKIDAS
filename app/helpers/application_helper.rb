# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def google_analytics
    if RAILS_ENV == "production"
      return <<-EOS
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-17740846-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
      EOS
    end
  end

  def google_adsense
    return <<-HEREDOC
<script type="text/javascript"><!--
google_ad_client = "ca-pub-2923857160325425";
/* YARUKIDAS */
google_ad_slot = "9888710771";
google_ad_width = 468;
google_ad_height = 60;
//-->
</script>
<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
    HEREDOC
  end

  def hbr(str)
    str = html_escape(str)
    str.gsub(/\r\n|\r|\n/, "<br />")
  end

  def rank_star(rank)
    rank = 10 if rank.to_i > 10

    rank_view = ""
    (rank.to_i).times do 
      rank_view += image_tag('star_on.png', :size => '25x25')
    end
    (10 - rank.to_i).times do 
      rank_view += image_tag('star_off.png', :size => '25x25')
    end
    return rank_view
  end

  def todays_complete_count
    return "今日の達成：" + Goal.finished_today.count.to_s + "件"
  end

  def this_weeks_complete_count
    return "今週の達成：" + Goal.finished_this_week.count.to_s + "件"
  end

  def todays_todo_count
    return "今日の追加：" + Goal.todo_today.count.to_s + "件"
  end

  def this_weeks_todo_count
    return "今週の追加：" + Goal.todo_this_week.count.to_s + "件"
  end
end
