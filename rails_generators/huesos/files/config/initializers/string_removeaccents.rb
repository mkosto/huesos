# RemoveAccents version 1.0.3 (c) 2008-2009 Solutions Informatiques Techniconseils inc.
# 
# This module adds 2 methods to the string class. 
# Up-to-date version and documentation available at:
#
# http://www.techniconseils.ca/en/scripts-remove-accents-ruby.php
#
# This script is available under the following license :
# Creative Commons Attribution-Share Alike 2.5.
#
# See full license and details at :
# http://creativecommons.org/licenses/by-sa/2.5/ca/
#
# Version history:
#   * 1.0.3 : July 23 2009
#               Corrected some incorrect character codes. Source is now wikipedia at:
#                 http://en.wikipedia.org/wiki/ISO/IEC_8859-1#Related_character_maps
#               Thanks to Raimon Fernandez for pointing out the incorrect codes.
#   * 1.0.2 : October 29 2008
#               Slightly optimized version of urlize - Jonathan Grenier (jgrenier@techniconseils.ca)
#   * 1.0.1 : October 29 2008
#               First public revision - Jonathan Grenier (jgrenier@techniconseils.ca)
#

class String
  # The extended characters map used by removeaccents. The accented characters 
  # are coded here using their numerical equivalent to sidestep encoding issues.
  # These correspond to ISO-8859-1 encoding.
  ACCENTS_MAPPING = {
    'E' => [200,201,202,203],
    'e' => [232,233,234,235],
    'A' => [192,193,194,195,196,197],
    'a' => [224,225,226,227,228,229,230],
    'C' => [199],
    'c' => [231],
    'O' => [210,211,212,213,214,216],
    'o' => [242,243,244,245,246,248],
    'I' => [204,205,206,207],
    'i' => [236,237,238,239],
    'U' => [217,218,219,220],
    'u' => [249,250,251,252],
    'N' => [209],
    'n' => [241],
    'Y' => [221],
    'y' => [253,255],
    'AE' => [306],
    'ae' => [346],
    'OE' => [188],
    'oe' => [189]
  }
  
  
  # Remove the accents from the string. Uses String::ACCENTS_MAPPING as the source map.
  def removeaccents    
    str = String.new(self)
    String::ACCENTS_MAPPING.each {|letter,accents|
      packed = accents.pack('U*')
      rxp = Regexp.new("[#{packed}]", nil, 'U')
      str.gsub!(rxp, letter)
    }
    
    str
  end
  
  def urlize(options = {})
    options[:remove_spaces] ||= false
    options[:space_replacement] ||= "-"
    options[:regexp] ||= /[^-_a-z0-9]/i
    
    str = self.strip.removeaccents.downcase
    str.gsub!(/\s/, options[:space_replacement]) unless options[:remove_spaces]
    str.gsub(options[:regexp], '')
  end
  
  def to_dom_id
    self.urlize(:space_replacement => "_")
  end
end