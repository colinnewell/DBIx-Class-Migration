package Local::v2::Schema::Result::ArtistCd;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('artist_cd');
__PACKAGE__->add_columns(
  artist_fk => {
    data_type => 'integer',
    is_foreign_key => 1,
    is_auto_increment => 1,
  },
  cd_fk => {
    data_type => 'integer',
    is_foreign_key => 1,
  });

__PACKAGE__->set_primary_key('artist_fk','cd_fk');

__PACKAGE__->belongs_to(
  'artist' => "Local::v2::Schema::Result::Artist",
  {'foreign.artist_id'=>'self.artist_fk'});

__PACKAGE__->belongs_to(
  'cd' => 'Local::v2::Schema::Result::Cd',
  {'foreign.cd_id'=>'self.cd_fk'});

1;
