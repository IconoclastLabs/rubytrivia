class StatesScreen < PM::TableScreen
  searchable
  refreshable

  title "States"

  def table_data
    @about_table_data ||= [{
      cells: [
        { title: "Alabama" },
        { title: "Alaska" },
        { title: "American Samoa" },
        { title: "Arizona" },
        { title: "Arkansas" },
        { title: "California" },
        { title: "Colorado" },
        { title: "Connecticut" },
        { title: "Delaware" },
        { title: "District of Columbia" },
        { title: "Florida" },
        { title: "Georgia" },
        { title: "Guam" },
        { title: "Hawaii" },
        { title: "Idaho" },
        { title: "Illinois" },
        { title: "Indiana" },
        { title: "Iowa" },
        { title: "Kansas" },
        { title: "Kentucky" },
        { title: "Louisiana" },
        { title: "Maine" },
        { title: "Maryland" },
        { title: "Massachusetts" },
        { title: "Michigan" },
        { title: "Minnesota" },
        { title: "Mississippi" },
        { title: "Missouri" },
        { title: "Montana" },
        { title: "Nebraska" },
        { title: "Nevada" },
        { title: "New Hampshire" },
        { title: "New Jersey" },
        { title: "New Mexico" },
        { title: "New York" },
        { title: "North Carolina" },
        { title: "North Dakota" },
        { title: "Northern Marianas Islands" },
        { title: "Ohio" },
        { title: "Oklahoma" },
        { title: "Oregon" },
        { title: "Pennsylvania" },
        { title: "Puerto Rico" },
        { title: "Rhode Island" },
        { title: "South Carolina" },
        { title: "South Dakota" },
        { title: "Tennessee" },
        { title: "Texas" },
        { title: "Utah" },
        { title: "Vermont" },
        { title: "Virginia" },
        { title: "Virgin Islands" },
        { title: "Washington" },
        { title: "West Virginia" },
        { title: "Wisconsin" },
        { title: "Wyoming" }
      ]
    }]
  end

  def on_refresh
    # refresh data
    stop_refreshing
    update_table_data
  end
end
