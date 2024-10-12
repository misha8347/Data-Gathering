import pandas as pd

#https://leetcode.com/problems/movie-rating/
def movie_rating(movies: pd.DataFrame, users: pd.DataFrame, movie_rating: pd.DataFrame) -> pd.DataFrame:
    users_join_movie_rating = pd.merge(users, movie_rating, on='user_id', how='inner')

    #part1
    movie_rating_count_by_user = users_join_movie_rating['name'].value_counts()
    max_count = movie_rating_count_by_user.max()
    max_indices = movie_rating_count_by_user[movie_rating_count_by_user == max_count].index
    ans_name = min(max_indices)

    #part2
    movie_rating_filtered = movie_rating[(movie_rating['created_at'] >= '2020-02-01') & (movie_rating['created_at'] <= '2020-02-29')]
    movies_join_movie_rating_filtered = pd.merge(movies, movie_rating_filtered, on='movie_id', how='inner')
    
    avg_movie_rating = movies_join_movie_rating_filtered[['title', 'rating']].groupby('title')['rating'].mean()
    max_rating = avg_movie_rating.max()
    max_movie_ratings = avg_movie_rating[avg_movie_rating == max_rating].index
    ans_movie = min(max_movie_ratings)

    ans = pd.DataFrame({
        'results': [ans_name, ans_movie]
    })

    return ans