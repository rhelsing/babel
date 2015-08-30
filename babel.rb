books = Dir.glob("books/*")
processes = []
books.each do |book|
  next if book.include?(".mobi")
  processes << Process.fork do
    to = "#{book}".gsub("epub", "mobi")
    response = %x( ebook-convert "#{book}" "#{to}")
    print "."
    exit
  end
end
Process.waitall
print "done."
