# This class defines end points and objects.
class Common

    def self.access_page(uri)
        WebDriver.browser.goto(uri)
        WebDriver.browser.div(:class, 'row-fluid-wrapper').wait_until_present
    end

    def self.access_form(id, name, text, value, xpath)
        filters_form = WebDriver.browser.form(:xpath, "//form[starts-with(@action, #{xpath})]")
        if !text.nil?
            text_field = filters_form.text_field(:name, name)
            text_field.set(text)
        end
        if !id.nil? && !value.nil?
            filters_form.select_list(:id, id).select(value)
        end
        filters_form.submit
    end

    def self.click_span(value)
        # click = WebDriver.browser.button(:class => 'btn', :title => 'search')
        click = WebDriver.browser.span(:class, value)
        return click.click if click.exists?
    end

    def self.click_button(t_value, c_value)
        click = WebDriver.browser.button(:type => t_value, :class => c_value)
        #click = WebDriver.browser.span(:class, value)
        return click.click if click.exists?
    end

    def self.search(text)
        if !text.nil?
            WebDriver.browser.text_field(:class, %w(hs-input act21-search__input)).set(text)
        end
    end

end
