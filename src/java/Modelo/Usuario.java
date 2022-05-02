/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import util.BancodeDados;

/**
 *
 * @author sala305b
 */
public class Usuario {

    private long id;
    private String login;
    private String responsavel;
    private String nome;
    private String senha;
    private Timestamp dataCadastro;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Timestamp getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Timestamp dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(String responsavel) {
        this.responsavel = responsavel;
    }

    public boolean verificarUsuario() {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT id "
                    + "FROM tb_usuario "
                    + "WHERE login = ? AND senha= ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getLogin());
            ps.setString(2, this.getSenha());
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int idusuario = rs.getInt("id");

                this.setId(idusuario);

                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean BuscarPorId(String id) {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT * FROM tb_usuario WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, this.getId());
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.setId(rs.getInt("id"));
                this.setResponsavel(rs.getString("responsavel"));
                this.setLogin(rs.getString("login"));
                this.setSenha(rs.getString("senha"));
                this.setDataCadastro(rs.getTimestamp("dtcadastro"));
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
}
