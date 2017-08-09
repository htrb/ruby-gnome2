# Copyright (C) 2008-2017  Ruby-GNOME2 Project Team
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

class TestPage < Test::Unit::TestCase
  def test_get_image
    document = Poppler::Document.new(image_pdf)
    page, mapping = find_first_image_mapping(document)
    assert_kind_of(Cairo::ImageSurface, page.get_image(mapping.image_id))
    assert_kind_of(Cairo::ImageSurface, mapping.image)
  end

  def test_selection_region
    document = Poppler::Document.new(form_pdf)
    page = document[0]
    rectangle = Poppler::Rectangle.new(0, 0, *page.size)
    region = page.get_selection_region(0.5, :word, rectangle)
    assert_kind_of(Poppler::Rectangle, region[0])
  end

  def test_annot_mapping
    document = Poppler::Document.new(form_pdf)
    page = document[0]
    assert_equal([Poppler::AnnotMapping],
                 page.annot_mapping.collect {|mapping| mapping.class}.uniq)
    mapping = page.annot_mapping[0]
    assert_kind_of(Poppler::Rectangle, mapping.area)
    assert_kind_of(Poppler::Annot, mapping.annot)
  end

  def test_text_layout
    only_poppler_version(0, 16, 0)
    document = Poppler::Document.new(form_pdf)
    page = document[0]
    layout = page.text_layout
    assert_equal([60, 31, 79, 60],
                 layout[0].to_a.collect(&:round))
  end

  private
  def find_first_image_mapping(document)
    document.each do |page|
      page.image_mapping.each do |mapping|
        return [page, mapping]
      end
    end
    nil
  end
end