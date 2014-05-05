module Jekyll
  module ImageGridFilter
    def convert_to_image_grid(input)

      image_grid = '' # concatenated text output
      default_ratio = 4/6

      input.each { |image_row|
        image_grid << '<div class="photo-row">'

        if !image_row['ratio'].to_s.empty? # if the ratio component isn't empty
          # image_grid << '<p>Ratio: ' + image_row['ratio'].to_s + '</p>'
          image_row.delete('ratio') # delete the ratio array item so that we are left with just images
        else
          # image_grid << "<p>Default Ratio: " + default_ratio.to_s + "</p>" # otherwise we're using the default ratio
        end


        image_row.each { |image_num, image| # go through each image in the row
          image_grid << '<div class="pgrid' + image_row.count.to_s + '">'

          image_grid << '<div class="image-pad" style="padding-bottom:66.666666666667%"><img data-src="' + image.to_s + '" class="resrc" alt="April Adventures - 1" /></div>'

          image_grid << '</div>'          
        }

      }

      return image_grid
    end
    
  end
end

Liquid::Template.register_filter(Jekyll::ImageGridFilter)