module UsersHelper
  def lang_tag(tag_id)
    select_tag tag_id, options_for_select(
                         [
                             [t("langs.none"), 0],
                             [t("langs.ukr"), 1],
                             [t("langs.eng"), 2],
                             [t("langs.ru"), 3]
                         ])
  end
end
