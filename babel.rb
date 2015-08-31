books = Dir.glob("books/*")
processes = []
books.each do |book|
  next unless book.include?(".epub")
  processes << Process.fork do
    to = "#{book}".gsub("epub", "mobi")
    %x( ebook-convert "#{book}" "#{to}")
    print "."
    exit
  end
end
Process.waitall
print "done."
