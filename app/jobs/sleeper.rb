class Sleeper
  @queue = :sleep

  def self.perform(seconds)
    Article.create(body: "New article", title: "Hello!")
    sleep(seconds)
  end
end
