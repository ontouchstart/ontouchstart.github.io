///
/// https://doc.rust-lang.org/book/ch10-02-traits.html
///
#[cfg(test)]
mod tests {
    trait Summary {
        fn summarize(&self) -> String;
        fn read_more(&self) -> String {
            String::from("(Read more...)")
        }
    }

    struct NewsArticle {
        pub headline: String,
        pub location: String,
        pub author: String,
        pub content: String,
    }

    impl Summary for NewsArticle {
        fn summarize(&self) -> String {
            format!(
                "{}, {} by {} ({})",
                self.headline, self.content, self.author, self.location
            )
        }
    }

    struct SocialPost {
        pub username: String,
        pub content: String,
    }

    impl Summary for SocialPost {
        fn summarize(&self) -> String {
            format!("{}: {}", self.username, self.content)
        }
    }

    #[test]
    fn test_news_article() {
        let article = NewsArticle {
            headline: String::from("Headline Test"),
            location: String::from("New York City"),
            author: String::from("Some Body"),
            content: String::from("of course, as you probably already know, people"),
        };

        assert_eq!(
            article.summarize(),
            "Headline Test, of course, as you probably already know, people by Some Body (New York City)"
        );
    }

    #[test]
    fn test_social_post() {
        let post = SocialPost {
            username: String::from("horse_ebooks"),
            content: String::from("of course, as you probably already know, people"),
        };

        assert_eq!(
            post.summarize(),
            "horse_ebooks: of course, as you probably already know, people"
        );
    }

    #[test]
    fn test_social_post_read_more() {
        let post = SocialPost {
            username: String::from("horse_ebooks"),
            content: String::from("of course, as you probably already know, people"),
        };
        assert_eq!(post.read_more(), "(Read more...)");
    }
}
