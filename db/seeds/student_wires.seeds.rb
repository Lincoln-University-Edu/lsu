20.times.each do
  StudentWire.create!(
    contact: "contact@me.com",
    title: "Some fancy title",
    body: "Some body text",
    cover_image: "cover@image.com",
    external_link: "external@link.com",
    student_wire_keywords: "keyword1, keyword2"
  )
end
