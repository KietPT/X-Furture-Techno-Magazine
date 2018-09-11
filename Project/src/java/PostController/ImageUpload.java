/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PostController;

import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.ArrayUtils;

/**
 *
 * @author KietPT
 */
@WebServlet(name = "ImageUploadServlet", urlPatterns = {"/upload_image"})
@MultipartConfig
public class ImageUpload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // The route on which the file is saved.
        
        File uploads = new File("texteditor/img/");
        String multipartContentType = "multipart/form-data";
        System.out.println(uploads.getAbsolutePath());
        String fieldname = "file";
        Part filePart = request.getPart(fieldname);
        System.out.println("content type: " + filePart.getContentType());
        System.out.println("name: " + filePart.getName());
        System.out.println("submitted file name: " + filePart.getSubmittedFileName());
        Map< Object, Object> responseData = null;

        // Create path components to save the file.
        final PrintWriter writer = response.getWriter();

        String linkName = null;
        String name = null;

        try {
            // Check content type.
            if (request.getContentType() == null
                    || request.getContentType().toLowerCase().indexOf(multipartContentType) == -1) {

                throw new Exception("Invalid contentType. It must be " + multipartContentType);
            }

            // Get file Part based on field name and also image extension.
            filePart = request.getPart(fieldname);
            String type = filePart.getContentType();
            
            type = type.substring(type.lastIndexOf("/") + 1);
            
            // Generate random name.
            String extension = type;
            extension = (extension != null && extension != "") ? "." + extension : extension;
            name = UUID.randomUUID().toString() + extension;

            // Get absolute server path.
            String absoluteServerPath = uploads + name;

            // Create link.
            String path = request.getHeader("referer");
            System.out.println(path);
            linkName = path + "files/" + name;
System.out.println(linkName.toString());
            // Validate image.
            String mimeType = filePart.getContentType();
            String[] allowedExts = new String[]{
                "gif",
                "jpeg",
                "jpg",
                "png",
                "svg",
                "blob"
            };
            String[] allowedMimeTypes = new String[]{
                "image/gif",
                "image/jpeg",
                "image/pjpeg",
                "image/x-png",
                "image/png",
                "image/svg+xml"
            };

            if (!ArrayUtils.contains(allowedExts, FilenameUtils.getExtension(absoluteServerPath))
                    || !ArrayUtils.contains(allowedMimeTypes, mimeType.toLowerCase())) {

                // Delete the uploaded image if it dose not meet the validation.
                File file = new File(uploads + name);
                if (file.exists()) {
                    file.delete();
                }

                throw new Exception("Image does not meet the validation.");
            }

            // Save the file on server.
            File file = new File(uploads, name);

            try (InputStream input = filePart.getInputStream()) {

                Files.copy(input, file.toPath());

            } catch (Exception e) {
                System.out.println(e);
//            	writer.println("<br/> ERROR: " + e);
            }
             
        } catch (Exception e) {
            e.printStackTrace();
            writer.println("You either did not specify a file to upload or are "
                    + "trying to upload a file to a protected or nonexistent "
                    + "location.");
            writer.println("<br/> ERROR: " + e.getMessage());
            responseData = new HashMap< Object, Object>();
            responseData.put("error", e.toString());

        } finally {
            // Build response data.
            responseData = new HashMap< Object, Object>();
            responseData.put("link", linkName);
           
            for(Entry<Object, Object> entry : responseData.entrySet()){
                System.out.println("key = " + entry.getKey().toString() + " value = " + entry.getValue().toString());
            }

            // Send response data.
            String jsonResponseData = new Gson().toJson(responseData);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponseData);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
