require 'faker'


10.times.each do
  # Create Lincolnian Articles
  Article.create!(
    author_name: Faker::Movies::StarWars.character,
    title: Faker::Book.title,
    description: Faker::Movies::StarWars.quote,
    body: '
    <p data-selectable-paragraph="">While timelines concerning the virus&rsquo;s spread vary from one place to the next, Riley says a good rule of thumb is that, once your city or town has a confirmed Covid-19 death, the virus has probably been in your community for about two weeks. He also says that, based on virus data collected in China, it&rsquo;s likely that many people who contract the virus have mild symptoms or, in some cases, no symptoms at all.</p>
    <p data-selectable-paragraph="">&ldquo;In fact, symptoms for most people are quite mild,&rdquo; says Dr. Sandro Galea, MD, a physician and dean of Boston University School of Public Health. He says that up to 80% of people who contract the virus have only weak symptoms &mdash; such as a low-grade fever or cough &mdash; and that they may have mistakenly attributed these to the common cold or some other minor ailment. &ldquo;It&rsquo;s definitely possible to have it and not realize it,&rdquo; he says.</p>
    <blockquote>
    <div data-selectable-paragraph="">
    <p><mark>A good rule of thumb is that, once your city or town has a confirmed Covid-19 death, the virus has probably been in your community for about two weeks.</mark></p>
    </div>
    </blockquote>
    <p data-selectable-paragraph="">Is there any way to know for sure? If your symptoms are gone, probably not. Riley says that the only way to look for a past infection is with an antibody test, which may not be able to tell the difference between Covid-19 and other common varieties of the coronavirus. And, as of right now, this test doesn&rsquo;t exist for the Covid-19. Even if you have a lingering cough or some other vestige of your illness, he says he doesn&rsquo;t recommend getting tested. Going to a place where testing resources are available could expose you to people who have the virus and also to other ill people who are infected with bugs you could catch. There&rsquo;s little sense in exposing yourself to sick people unless you absolutely must. &ldquo;Stay home,&rdquo; he says.</p>
    <p data-selectable-paragraph="">The one exception, he adds, is if you&rsquo;re going to have to interact with an elderly relative or someone who is immune-compromised, so you need to know if your symptoms are related to Covid-19. &ldquo;On a case-by-case basis, there may be a reason you need to be tested,&rdquo; he says. But keep in mind that you won&rsquo;t have your test results for a few days. And even if you test negative for Covid-19, you wouldn&rsquo;t want to spread whatever you have to a sick or aging loved one.</p>
    <p data-selectable-paragraph="">Test or no test, if you think you may have had Covid-19, you may also be wondering if you can get it again. &ldquo;Good question,&rdquo; says Boston U&rsquo;s Galea. &ldquo;That remains unresolved, but there likely is some immunity once one has had Covid-19. Whether that immunity is complete or not is less clear.&rdquo; That means if you get it again, you&rsquo;re probably more likely to have a mild or asymptomatic case.</p>
    ',
    article_keywords: "the best, simply the best, the very best",
    cover_image: "https://images.unsplash.com/photo-1584952574167-560f02ab3f3d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    article_category: "Lincolnian"
  )


  # Create Lincolnian Press Articles

  Article.create!(
    author_name: Faker::Movies::StarWars.character,
    title: Faker::Book.title,
    description: Faker::Movies::StarWars.quote,
    body: '
    <p data-selectable-paragraph="">While timelines concerning the virus&rsquo;s spread vary from one place to the next, Riley says a good rule of thumb is that, once your city or town has a confirmed Covid-19 death, the virus has probably been in your community for about two weeks. He also says that, based on virus data collected in China, it&rsquo;s likely that many people who contract the virus have mild symptoms or, in some cases, no symptoms at all.</p>
    <p data-selectable-paragraph="">&ldquo;In fact, symptoms for most people are quite mild,&rdquo; says Dr. Sandro Galea, MD, a physician and dean of Boston University School of Public Health. He says that up to 80% of people who contract the virus have only weak symptoms &mdash; such as a low-grade fever or cough &mdash; and that they may have mistakenly attributed these to the common cold or some other minor ailment. &ldquo;It&rsquo;s definitely possible to have it and not realize it,&rdquo; he says.</p>
    <blockquote>
    <div data-selectable-paragraph="">
    <p><mark>A good rule of thumb is that, once your city or town has a confirmed Covid-19 death, the virus has probably been in your community for about two weeks.</mark></p>
    </div>
    </blockquote>
    <p data-selectable-paragraph="">Is there any way to know for sure? If your symptoms are gone, probably not. Riley says that the only way to look for a past infection is with an antibody test, which may not be able to tell the difference between Covid-19 and other common varieties of the coronavirus. And, as of right now, this test doesn&rsquo;t exist for the Covid-19. Even if you have a lingering cough or some other vestige of your illness, he says he doesn&rsquo;t recommend getting tested. Going to a place where testing resources are available could expose you to people who have the virus and also to other ill people who are infected with bugs you could catch. There&rsquo;s little sense in exposing yourself to sick people unless you absolutely must. &ldquo;Stay home,&rdquo; he says.</p>
    <p data-selectable-paragraph="">The one exception, he adds, is if you&rsquo;re going to have to interact with an elderly relative or someone who is immune-compromised, so you need to know if your symptoms are related to Covid-19. &ldquo;On a case-by-case basis, there may be a reason you need to be tested,&rdquo; he says. But keep in mind that you won&rsquo;t have your test results for a few days. And even if you test negative for Covid-19, you wouldn&rsquo;t want to spread whatever you have to a sick or aging loved one.</p>
    <p data-selectable-paragraph="">Test or no test, if you think you may have had Covid-19, you may also be wondering if you can get it again. &ldquo;Good question,&rdquo; says Boston U&rsquo;s Galea. &ldquo;That remains unresolved, but there likely is some immunity once one has had Covid-19. Whether that immunity is complete or not is less clear.&rdquo; That means if you get it again, you&rsquo;re probably more likely to have a mild or asymptomatic case.</p>
    ',
    article_keywords: "the best, simply the best, the very best",
    cover_image: "https://images.unsplash.com/photo-1584952574167-560f02ab3f3d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    article_category: "Lincoln Press"
  )
end
