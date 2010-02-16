use MooseX::Declare;

class Gitalist::ContentMangler::Resolver::Default with Gitalist::ContentMangler::Resolver {
    method resolve ($data) {
        return unless $data->{filename};
        my $language = 'Perl' if $data->{filename} =~ /\.p[lm]$/i;
        my @list;
        push(@list, ['Pod2Html', {}]) if $data->{filename} =~ /\.(pod|p[lm])$/i;
        push(@list, ['SyntaxHighlight', {language => $language, css => $language}]) if $language;
        return @list;
    }
}
