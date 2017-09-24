package com.app.db;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.app.bean.db.MovieInfo;
import com.app.bean.json.SelectListItem;

public class DbMovie {

    private DbConfigHelper dbConfig = null;

    public DbMovie(DbConfigHelper dbConfig) {
        this.dbConfig = dbConfig;
    }

    public List<SelectListItem> fillMovieList() throws Exception {
        try {
            SelectListItem firstItem = new SelectListItem();
            firstItem.setText("--SELECT--");
            firstItem.setValue("0");

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource);

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);

            List<SelectListItem> data = run.query(
                    "SELECT distinct Movie_Name as text, Movie_Name as value FROM ShowInfo WHERE Show_Date>=NOW() and Movie_Name is not null;",
                    h);

            if (data == null) {
                data = new ArrayList<SelectListItem>();
            }
            data.add(0, firstItem);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<SelectListItem> getMoviesImageURL() throws Exception {
        try {
            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource);

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);

            List<SelectListItem> data = run
                    .query("SELECT Movie_ImageURL as text FROM MovieInfo where Movie_Status=1 or Movie_Status=2;", h);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<MovieInfo> getRunningMovies() throws Exception {
        try {
            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource);

            ResultSetHandler<List<MovieInfo>> h = new BeanListHandler<MovieInfo>(MovieInfo.class);

            List<MovieInfo> data = run.query(
                    "SELECT Movie_Id,Movie_ImageURL ,Movie_Status ,Movie_Title ,Movie_ReleaseDate,Movie_Director ,Movie_Casts ,Movie_Language ,Movie_Industry FROM MovieInfo where Movie_Status=1",
                    h);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<MovieInfo> getUpCommingMovies() throws Exception {
        try {
            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource);

            ResultSetHandler<List<MovieInfo>> h = new BeanListHandler<MovieInfo>(MovieInfo.class);

            List<MovieInfo> data = run.query(
                    "SELECT Movie_Id,Movie_ImageURL ,Movie_Status ,Movie_Title ,Movie_ReleaseDate,Movie_Director ,Movie_Casts ,Movie_Language ,Movie_Industry FROM MovieInfo where Movie_Status=2",
                    h);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<MovieInfo> getMoviesToRemove() throws Exception {
        try {
            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            ResultSetHandler<List<MovieInfo>> h = new BeanListHandler<MovieInfo>(MovieInfo.class);

            List<MovieInfo> data = run.query(
                    "    SELECT MovieInfo.Movie_Id, MovieInfo.Movie_Title, MovieStatusInfo.MovieStatus_Value, "
                    + "                        Movie_ReleaseDate "
                    + "                        FROM MovieInfo "
                    + "                        JOIN MovieStatusInfo on MovieInfo.Movie_Status=MovieStatusInfo.MovieStatus_Id "
                    + "                        where Movie_Status<>3;",
                    h);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public boolean removeMovie(String[] ids) throws Exception {
        try {

            String sql = "UPDATE MovieInfo SET Movie_Status = 3 WHERE Movie_Id in (" + String.join(",", ids) + ")";

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            int result = run.update(sql);

            return result > 0;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public boolean addNewMovie(MovieInfo obj) throws Exception {
        try {

            String sql = "INSERT INTO MovieInfo (Movie_ImageURL,Movie_Status,Movie_Title,"
                    + "Movie_ReleaseDate,Movie_Director,Movie_Casts,Movie_Language,Movie_Industry) "
                    + "VALUES (?,?,?,?,?,?,?,?);";

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            int result = run.update(sql, obj.getMovie_ImageURL(), obj.getMovie_Status(), obj.getMovie_Title(),
                    obj.getMovie_ReleaseDate(), obj.getMovie_Director(), obj.getMovie_Casts(), obj.getMovie_Language(), obj.getMovie_Industry()
            );

            return result > 0;
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<SelectListItem> getMovieList() throws Exception {
        try {
            SelectListItem firstItem = new SelectListItem();
            firstItem.setText("--SELECT--");
            firstItem.setValue("0");

            DataSource dataSource = new com.app.db.DataSource(this.dbConfig).getBds();

            QueryRunner run = new QueryRunner(dataSource, true);

            ResultSetHandler<List<SelectListItem>> h = new BeanListHandler<SelectListItem>(SelectListItem.class);

            List<SelectListItem> data = run.query("SELECT Movie_Title as text ,Movie_Title as value FROM MovieInfo WHERE Movie_Status<>3", h);

            if (data == null) {
                data = new ArrayList<SelectListItem>();
            }
            data.add(0, firstItem);
            return data;
        } catch (Exception ex) {
            throw ex;
        }
    }

}
