module URLExtension
    def sanitize_url(str)
        original = "/" + str.gsub(%r!/{2,}!, "/").gsub(%r!\.+/|\A/+!, "")
        extended = original.gsub(/\d+-/, '') ## removes the digits prefix
        extended
    end
end

module Jekyll
    class URL
        prepend URLExtension
    end
end


Jekyll::Hooks.register :pages, :pre_render do |page|
    ## modifies internal links by removing:
    ## 1) the digits prefix of directory and files names
    ## 2) the .md extension
    page.content = page.content.gsub(/(\[[^\]]*?\]\(\.\.\/)\d+-([^\/\)]*)(\/)\d+-([^\/\)]*)(\.md)(\)|#.*?.*?\)|\?.*\))/, '\1\2\3\4\6')
end