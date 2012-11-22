ActiveAdmin.register_page "Dashboard" do

    menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

    content :title => proc{ I18n.t("active_admin.dashboard") } do
    
        columns do
            column do
                panel "Recently Added Tracks" do
                    table_for Track.order("release_date desc").limit(5) do
                        column :title do |track|
                            link_to track.title, [:admin, track]
                        end

                        column :release_date
                        
                        column :price do |track|
                            number_to_currency(track.price, :unit => "&pound;")
                        end
                    end
                    strong { link_to "View All Tracks", admin_tracks_path }
                end
            end
        end
    end
end